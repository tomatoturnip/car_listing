class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_path, notice: "Successfully created car"
    else
      render 'new'
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  private
  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end
end
