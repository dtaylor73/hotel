require "pry"

module Hotel
  class Reservation
    attr_reader :room, :date_range, :total_cost

    def initialize(room: , date_range: )
      @room = room
      @date_range = date_range
      @total_cost = calculate_reservation_cost
    end 

    def calculate_reservation_cost
      duration_of_stay = date_range.end_date - date_range.start_date
      duration_of_stay.to_i * 200
    end
  end
end
