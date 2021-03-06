class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :redirect_if_not_logged_in

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @cars = user.cars
    else
      @cars = Car.all
    end 
  end

  def order
    @cars = Car.sort_by_high_rating.includes(:test_drives)
    render :index
  end

  def show
    set_car
  end

  def new
    @car = Car.new
  end

  def edit
    if able_to_edit?(@car)
      render :edit
    else
      redirect_to @car
    end
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
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
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
