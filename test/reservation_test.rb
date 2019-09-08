require_relative "test_helper"

describe "Reservation" do 
  before do
    #Arrange
    room = Hotel::Room.new(room_number: 1, room_cost: 200)
    date_range = Hotel::Date_Range.new(start_date: Date.parse("2019-02-03"), end_date: Date.parse("2019-02-05"))

    #Act
    @reservation = Hotel::Reservation.new(
      room: room, 
      date_range: date_range
    )
  end

  describe "Reservation instantiation" do
    it "is instance of Reservation" do
      #Assert
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end 

    it "stores an instance of room" do
      expect(@reservation.room).must_be_kind_of Hotel::Room
    end 

    it "stores an instance of date_range" do
      expect(@reservation.date_range).must_be_kind_of Hotel::Date_Range
    end
  end
   
  describe "calculate_reservation_cost method" do
    it "calculates the cost of a reservation" do
      #Act 
      result = @reservation.calculate_reservation_cost

      #Assert
      expect(result).must_be_kind_of Integer
      expect(result).must_be :>, 0
    end 
  end 
end