module Hotel
  class Room
    attr_reader :room_number, :room_cost 

    def initialize(room_number: , room_cost:)
      @room_number = room_number
      @room_cost = room_cost 
    end

    def self.load_all
      (1..20).map do |i|
      self.new(room_number:[i],
      room_cost: 200)
      end 
    end
  end
end