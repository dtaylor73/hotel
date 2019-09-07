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

    #I can view a list of rooms that are not reserved for a given date range, so that I can see all 
    #available rooms for that day

    # I can access the list of reservations for a specific date, so that I can track reservations 
    # by date

    # def list_available_rooms(start_date, end_date)
      # reserved_room_numbers = []
      # reservations.each do |reservation|
      #   if reservation.date_range.start_date == start_date && reservation.date_range.end_date == end_date
      #     reserved_room_numbers.push(reservation.room.room_number)
      #   end 
      # end 
      
      # available_rooms = []
      # rooms.each do |room|
      #   if reserved_room_numbers.include?(room.room_number) == false
      #     available_rooms.push(room)
      #   end
      # end
      # available_rooms
    # end

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
        if reservation.date_range.start_date == start_date && reservation.date_range.end_date == end_date
          reserved_room_numbers.push(reservation.room.room_number)
        end 
      end 
      reserved_room_numbers
    end
  end
end

#All the rooms are booked?
# No rooms are booked?
