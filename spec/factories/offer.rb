FactoryBot.define do

  factory :offer do
    sequence(:advertiser_name) { |n| "advertiser #{n}" }
    url "http://example.com"
    description "description"
    starts_at Date.yesterday
    ends_at Date.tomorrow
    state :disabled
    premium false
    manual_disable false
  end

end
