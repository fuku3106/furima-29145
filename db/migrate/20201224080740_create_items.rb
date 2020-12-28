class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :description,           null: false
      t.integer :condition_id,       null: false
      t.integer :category_id,        null: false
      t.integer :shipping_id,        null: false
      t.integer :delivery_area_id,   null: false
      t.integer :days_to_ship_id,    null: false
      t.integer :price,              null: false
      t.timestamps
      
    end
  end
end

# rails g migration AddUserToItems user:references

# rails g migration AddReferencesToItems