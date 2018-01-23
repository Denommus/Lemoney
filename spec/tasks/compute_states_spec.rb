require 'rails_helper'

RSpec.describe "Compute states task", type: :task do
  it "enables offers that started yesterday and will end tomorrow" do
    create_list(:offer, 5)
    expect { invoke_task }.to change { Offer.where(state: :enabled).count }.from(0).to(5)
  end


  it "disables offers that started yesterday and end today" do
    create_list(:offer, 5, ends_at: Date.today, state: :enabled)
    expect { invoke_task }.to change { Offer.where(state: :disabled).count }.from(0).to(5)
  end

  it "enables offers that started yersterday and don't end" do
    create_list(:offer, 5, ends_at: nil)
    expect { invoke_task }.to change { Offer.where(state: :enabled).count }.from(0).to(5)
  end

  it "disables offers that were manually disabled" do
    create_list(:offer, 5, manual_disable: true, state: :enabled)
    expect { invoke_task }.to change { Offer.where(state: :disabled).count }.from(0).to(5)
  end

  private

  def invoke_task
    task = Rake::Task["compute_states"]
    task.reenable
    task.invoke
  end
end
