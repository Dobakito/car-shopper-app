class TestDrivesController < ApplicationController
  before_action :set_test_drive, only: %i[ show update destroy ]

  def index
    @test_drives = TestDrive.all
  end


  def show
    set_test_drive
  end


  def new
    if params[:car_id]
      car = Car.find(params[:car_id])
      @test_drive = car.test_drives.build
    else
      @test_drive = TestDrive.new
    end
  end

  def create
    @test_drive = current_user.test_drives.build(test_drive_params)
    if @test_drive.save
      redirect_to car_path(@test_drive.car_id)
    else
      render :new
    end
  end

  def destroy
    set_test_drive
    @test_drive.destroy
  end

  private

    def set_test_drive
      @test_drive = TestDrive.find(params[:id])
    end

    def test_drive_params
      params.require(:test_drive).permit(:title, :description, :rating, :car_id, :user_id)
    end
end
