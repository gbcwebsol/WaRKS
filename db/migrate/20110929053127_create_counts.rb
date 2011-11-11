class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|

      t.integer :value, :default => 1
      t.date :date

      t.timestamps
    end
  end
end
