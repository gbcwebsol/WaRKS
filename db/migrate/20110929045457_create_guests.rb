class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|

      t.integer :accept_number

      t.references :department
      t.references :section

      t.boolean :finish, :default => false
      t.boolean :pass, :default => false
      
      t.timestamp :deleted_at #acts_as_paranoid

      t.timestamps
    end
  end
end
