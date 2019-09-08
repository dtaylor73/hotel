require "pry"

module Hotel
  class Reservation
    # attr_reader is making the instance variables readable
    attr_reader :room, :date_range, :total_cost

    # parameter is just taking in input from user
    def initialize(room: , date_range: )
      @room = room
      @date_range = date_range
      @total_cost = calculate_reservation_cost
      #you wouldn't set "calculate_reservation_cost" to the total_cost parameter
      # because you don't want to give the user the option of changing it. 

    end 

    def calculate_reservation_cost
      duration_of_stay = date_range.end_date - date_range.start_date
      duration_of_stay.to_i * 200
    end
  end
end
