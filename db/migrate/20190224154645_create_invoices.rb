class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :identifier,       null: false
      t.integer :seller_id,       null: false
      t.integer :buyer_id,        null: false
      t.text :description,        null: false
      t.float :total,             null: false
      t.string :sending_address

      t.timestamps
    end
  end
end
