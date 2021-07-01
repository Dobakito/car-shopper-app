class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.belongs_to :user
      t.belongs_to :category
      t.string :name
      t.integer :price
      t.timestamps
    end
  end
end
