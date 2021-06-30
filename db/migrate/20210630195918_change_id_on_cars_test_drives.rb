class ChangeIdOnCarsTestDrives < ActiveRecord::Migration[6.1]
  def change
    rename_column :cars_test_drives, :test_drife_id, :test_drive_id
  end
end
