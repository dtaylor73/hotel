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

    def make_reservation(start_date, end_date)
      reservations << Hotel::Reservation.new(id: 2, 
        room: Hotel::Room.new(room_number: 3, room_cost: 200), 
        date_range: Hotel::Date_Range.new(start_date: start_date,
        end_date: end_date)) 
        # binding.pry 
    end

    def find_reservation(start_date, end_date)
      found_reservations = []
      reservations.each do |reservation|
        if reservation.date_range.start_date == start_date && reservation.date_range.end_date == end_date
          found_reservations.push(reservation)
        end 
      end
      found_reservations
    end
  end
end
