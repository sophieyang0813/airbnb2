class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
   	  t.belongs_to :user, index: true
      t.integer :price
      t.string :location
      t.integer :num_of_guests

      t.timestamps
    end
  end
end
