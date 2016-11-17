class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all

    render json: @bookings
  end

  # GET /bookings/1
  def show
    render json: @booking
  end

  # POST /bookings
  def create
    my_params = booking_params
    # parse the dates that come in string format
    my_params[:beginning_hour] = my_params[:beginning_hour].to_datetime
    my_params[:ending_hour]    = my_params[:ending_hour].to_datetime
    my_params[:date]           = my_params[:beginning_hour].to_datetime

    @booking = Booking.new(my_params)

    if @booking.save
      # change the time in the db to localtime before render
      response = {
        name:           @booking.name,
        description:    @booking.description,
        date:           @booking.date.localtime,
        beginning_hour: @booking.beginning_hour.localtime,
        ending_hour:    @booking.ending_hour.localtime,
        id:             @booking.id
      }

      render json: response
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
  end

  def search()
    render json: Booking.search(params[:date])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.permit(:date, :name, :description,
                    :beginning_hour, :ending_hour)
    end
end
