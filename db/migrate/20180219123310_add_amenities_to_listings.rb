class AddAmenitiesToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :amenities, :string, array: true, default: [] 
  end
end
