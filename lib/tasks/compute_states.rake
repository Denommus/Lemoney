desc "Compute the state of every offer in the system. This should be set up in a schedule such as crontab"
task compute_states: :environment do
  puts "Computing the states"

  # Since when I set manual_disable to true I already set state to disabled, I don't need to filter by manual_disable: true
  Offer.where(manual_disable: false).where("starts_at <= :date AND (ends_at IS NULL OR ends_at >= :date)", { date: Time.now }).update(state: :enabled)
  Offer.where(manual_disable: false).where("ends_at IS NOT NULL AND ends_at <= ?", Time.now).update(state: :disabled)

  puts "Successfully computed the states"
end
