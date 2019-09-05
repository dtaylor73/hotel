require_relative "test_helper"

describe "Room" do
  describe "Room instantiation" do
    before do
      #Arrange
      room_number = 2
      room_cost = 200

      #Act
      @room = Hotel::Room.new(
        room_number: room_number, 
        room_cost: room_cost
      )
    end

    it "is an instance of Room" do
      #Assert
      expect(@room).must_be_kind_of Hotel::Room
    end
  end
end
