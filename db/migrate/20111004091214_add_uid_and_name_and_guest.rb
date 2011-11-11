class AddUidAndNameAndGuest < ActiveRecord::Migration
  def change
    add_column :guests, :uid, :string    
    add_column :guests, :name, :string
  end
end
