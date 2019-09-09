require_relative "test_helper"

describe "Room" do
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

  describe "Room instantiation" do
    it "is an instance of Room" do
      expect(@room).must_be_kind_of Hotel::Room
    end
  end 

  describe "load_all method" do 
    it "returns array of 20 elements" do
      result = Hotel::Room.load_all

      expect(result).must_be_kind_of Array
      expect(result.length).must_equal 20 
    end 

    it "each element in returned array is a room object" do
      result = Hotel::Room.load_all

      result.each do |object| 
        expect(object).must_be_kind_of Hotel::Room
      end 
    end 
  end
end
