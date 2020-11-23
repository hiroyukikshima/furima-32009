class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title,               null: false
      t.text    :explanation,         null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :shipping_charges_id, null: false
      t.integer :shipment_source_id,  null: false
      t.integer :days_id,             null: false
      t.integer :price,               null: false
      t.timestamps
    end
  end
end
