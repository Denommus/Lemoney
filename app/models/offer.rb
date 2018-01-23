class Offer < ApplicationRecord
  enum state: [:disabled, :enabled]

  validates :url, presence: true, uri: true
  validates :advertiser_name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :starts_at, presence: true
end
