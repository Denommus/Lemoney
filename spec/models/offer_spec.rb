require 'rails_helper'

RSpec.describe "Offer", type: :model do
  context "URI" do
    it "Doesn't allow invalid URIs" do
      offer = build(:offer, url: "foo")
      expect(offer.valid?).to be(false)
    end

    it "Allows valid URIs" do
      offer = build(:offer, url: "http://foo.com")
      expect(offer.valid?).to be(true)
    end
  end

  context "Description" do
    it "Expects the description to be 500 chars long" do
      offer = build(:offer, description: ("0"*501))
      expect(offer.valid?).to be(false)
      offer.description = "0"*500
      expect(offer.valid?).to be(true)
    end
  end
end
