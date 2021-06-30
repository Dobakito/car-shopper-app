class CreateTestDrives < ActiveRecord::Migration[6.1]
  def change
    create_table :test_drives do |t|
      t.string :title
      t.string :description
      t.integer :rating
      t.timestamps
    end
  end
end
