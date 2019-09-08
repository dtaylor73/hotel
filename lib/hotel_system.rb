require "Pry"
module Hotel
  class Hotel_System
    attr_reader :rooms
    attr_accessor :reservations

    def initialize(rooms: Hotel::Room.load_all, reservations: [])
      @rooms = rooms
      @reservations = reservations 
    end

    def list_rooms
      rooms
    end 

    def no_rooms_available
      raise ArgumentError, "There are no rooms available for that given date range."
    end

    def list_available_room_numbers(start_date, end_date)
      available_rooms = list_available_rooms(start_date, end_date)
      available_room_numbers = available_rooms.map do |room|
        available_rooms[0].room_number
      end 
      available_room_numbers.sample
    end 

    def make_reservation(start_date, end_date)

      if list_available_room_numbers(start_date, end_date) == nil
        no_rooms_available
      else 
        reservations << Hotel::Reservation.new(
        room: Hotel::Room.new(room_number: list_available_room_numbers(start_date, end_date), room_cost: 200), 
        date_range: Hotel::Date_Range.new(start_date: start_date,
        end_date: end_date)) 
      end
    end

    # I can access the list of reservations for a specific date, so that I can track reservations by date
    def find_reservation(start_date, end_date)
      found_reservations = []
      reservations.each do |reservation|
        # if reservation.date_range.start_date == start_date && reservation.date_range.end_date == end_date
        #   found_reservations.push(reservation)
        # end 
        if (reservation.date_range.start_date >= start_date && reservation.date_range.start_date < end_date) || 
          (reservation.date_range.end_date >= start_date && reservation.date_range.end_date <= end_date)
          found_reservations.push(reservation)
        end
      end
      found_reservations
    end

    # I can get/make a reservation of a room for a given date range, and that room 
    # will not be part of any other reservation overlapping that date range
    # A reservation is allowed start on the same day that another reservation for the same room ends

    #returns a list of available rooms for this given date range
    def list_available_rooms (start_date, end_date)
      booked_rooms = list_reserved_room_numbers(start_date, end_date)
      available_rooms = []
      rooms.each do |room|
        if booked_rooms.include?(room.room_number) == false
          available_rooms.push(room)
        end
      end
      available_rooms
    end 

    private
    # This won't need a test since it is private
    def list_reserved_room_numbers(start_date, end_date)
      reserved_room_numbers = []
      reservations.each do |reservation|
        # if reservation.date_range.start_date == start_date && reservation.date_range.end_date == end_date
        #   reserved_room_numbers.push(reservation.room.room_number)
        # end 
        if (reservation.date_range.start_date >= start_date && reservation.date_range.start_date < end_date) || 
          (reservation.date_range.end_date >= start_date && reservation.date_range.end_date <= end_date)
          reserved_room_numbers.push(reservation.room.room_number)
        end
      end 
      reserved_room_numbers

    end
  end
end

#Edge cases
#All the rooms are booked?
# No rooms are booked?
