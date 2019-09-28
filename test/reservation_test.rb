require_relative "test_helper"

describe "Reservation" do 
  before do

    room = 3
    start_date = Date.parse("2019-02-03")
    end_date = Date.parse("2019-02-05")

    @reservation = Hotel::Reservation.new(
      room: room, 
      start_date: start_date,
      end_date: end_date,
    )
  end

  describe "Reservation instantiation" do
    it "is instance of Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end 
  end

  describe "make_reservation" do
    it "makes and pushes reservations into the total_reservations array" do
      @reservation.make_reservation(3, Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      expect(@reservation.total_reservations.length).must_equal 1 
    end
  end

  describe "list_reserved_room_numbers" do
    it "returns an array of reserved room numbers for a given date range" do
      @reservation.make_reservation(3, Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      
      result = @reservation.list_reserved_room_numbers(Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      expect(result[0]).must_equal 3
    end 
  end

  describe "find_reservation" do
    it "returns an array of all the reservation instances" do
      @reservation.make_reservation(4, Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      @reservation.make_reservation(5, Date.parse("2019-02-03"), Date.parse("2019-02-05"))

      result = @reservation.find_reservation(Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      expect(result.length).must_equal 2
    end
  end 
end