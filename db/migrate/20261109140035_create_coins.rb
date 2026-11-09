class CreateCoins < ActiveRecord::Migration[7.2]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :symbol
      t.decimal :current_price
      t.integer :market_cap
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
