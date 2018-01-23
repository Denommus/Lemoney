desc "Compute the state of every offer in the system. This should be set up in a schedule such as crontab"
task compute_states: :environment do
  puts "Computing the states"

  Offer.where(manual_disable: false).where("starts_at <= :date AND (ends_at IS NULL OR ends_at >= :date)", { date: Time.now }).update(state: :enabled)
  Offer.where(manual_disable: false).where("ends_at IS NOT NULL AND ends_at <= ?", Time.now).update(state: :disabled)

  # Even though I manually set the state to disabled in the toggle_disable action, it's better to guarantee that no manually disabled offer is reenabled by accident
  Offer.where(manual_disable: true).update(state: :disabled)

  puts "Successfully computed the states"
end
