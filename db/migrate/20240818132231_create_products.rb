class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :price_cents
      t.string :currency
      t.string :url_id

      t.timestamps
    end
  end
end
