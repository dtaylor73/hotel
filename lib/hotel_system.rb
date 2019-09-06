module Hotel
  class Hotel_System
    attr_reader :rooms, :reservations

    def initialize(rooms: Hotel::Room.load_all, reservations: [])
      @rooms = rooms
      @reservations = reservations 
    end

    def list_rooms
      rooms
    end 

    # def make_reservation(start_date, end_date)
    # end


  end
end
