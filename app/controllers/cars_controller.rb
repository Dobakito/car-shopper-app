class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  def index
    @cars = Car.all
  end

  def show
    set_car
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    @car.user_id = session[:user_id]
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end


  def update

  end


  def destroy
    set_car
    @car.destroy
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:name, :price, :category_id, :image)
    end
end
