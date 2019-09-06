module Hotel
  class Hotel_System
    attr_reader :rooms, :reservations

    def initialize(rooms: , reservations:)
      @rooms = rooms
      @reservations = reservations || []
    end
  end
end
