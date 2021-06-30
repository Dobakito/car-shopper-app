class TestDrivesController < ApplicationController
  before_action :set_test_drive, only: %i[ show edit update destroy ]

  def index
    @test_drives = TestDrive.all
  end


  def show
  end


  def new
    @test_drive = TestDrive.new
  end


  def edit
  end

  def create
    @test_drive = TestDrive.new(test_drife_params)
  end

  def update

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
      params.require(:test_drive).permit(:title, :description, :rating)
    end
end
