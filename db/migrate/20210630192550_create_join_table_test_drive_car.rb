class CreateJoinTableTestDriveCar < ActiveRecord::Migration[6.1]
  def change
    create_join_table :test_drives, :cars do |t|
       t.index [:test_drive_id, :car_id]
       t.index [:car_id, :test_drive_id]
    end
  end
end
