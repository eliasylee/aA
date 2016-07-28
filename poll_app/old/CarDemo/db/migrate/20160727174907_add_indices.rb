class AddIndices < ActiveRecord::Migration
  def change
    add_index :cars, :owner_id
    add_index :rentals, :renter_id
    add_index :rentals, [:renter_id, :car_id]
  end
end
