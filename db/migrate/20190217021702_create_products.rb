class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,         null: false
      t.belongs_to :category
      t.belongs_to :user
      t.string :identifier
      t.string :slug
      t.string :description,  null: false
      t.integer :stock,       null: false
      t.float :price,         null: false

      t.timestamps
    end
  end
end
