class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :advertiser_name, null: false, index: { unique: true }
      t.string :url, null: false
      t.string :description, limit: 500, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: true
      t.integer :state, null: false, default: 0
      t.boolean :premium, default: false
      t.boolean :manual_disable, default: false

      t.timestamps
    end
  end
end
