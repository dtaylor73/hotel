

module Hotel
  class Reservation
    attr_reader :room, :start_date, :end_date
    attr_accessor :total_reservations

    def initialize(room: , start_date: , end_date: , total_reservations: [])
      @room = room
      @start_date = start_date
      @end_date = end_date
      @total_reservations = total_reservations
    end 

    def make_reservation(room, requested_start_date, requested_end_date)
      total_reservations << Reservation.new(
      room: room, 
      start_date: start_date,
      end_date: end_date)
    end

    def list_reserved_room_numbers(requested_start_date, requested_end_date)
      reserved_rooms = []

      total_reservations.each do |reservation|
        if (start_date >= requested_start_date && end_date < requested_end_date) ||
          (end_date >= requested_start_date && end_date <= requested_end_date)
          reserved_rooms.push(room)
        end
      end 
      reserved_rooms 
    end

    def find_reservation(requested_start_date, requested_end_date)
      found_reservations = []

      total_reservations.each do |reservation|
        if (start_date >= requested_start_date && start_date < requested_end_date) || 
          (end_date >= requested_start_date && end_date <= requested_end_date)
          found_reservations.push(reservation)
        end
      end
      found_reservations
    end 
  end 
end

