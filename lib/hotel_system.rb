
require "pry"
module Hotel
  class Hotel_System
    attr_reader :rooms
    attr_accessor :reservation

    def initialize(rooms: [], reservation: nil )
      @rooms = rooms 
      @reservation =  reservation
    end

    def list_rooms
      rooms
    end 

    def no_rooms_available
      raise ArgumentError, "There are no rooms available for that given date range."
    end

    def reservation?(room, start_date, end_date)
      available_room = list_available_rooms(start_date, end_date)
     
      if available_room.sample == nil
        no_rooms_available
      else 
        reservation.make_reservation(room, start_date, end_date)
      end
    end

    def find_reservation(start_date, end_date)
      reservation.find_reservation(start_date, end_date)
    end

    def list_available_rooms(start_date, end_date)
      booked_rooms = list_reserved_room_numbers(start_date, end_date)

      available_rooms = []
      rooms.each do |room|
        if booked_rooms.include?(room) == false
          available_rooms.push(room)
        end
      end
      available_rooms
    end 

    def list_reserved_room_numbers(requested_start_date, requested_end_date)
      reservation.list_reserved_room_numbers(requested_start_date, requested_end_date)
    end
  end
end


