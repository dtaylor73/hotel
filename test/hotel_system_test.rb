require_relative "test_helper"
require "minitest/skip_dsl"

describe "Hotel_System" do 
  before do 
    rooms = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    reservation = 
      Hotel::Reservation.new( 
      room: 3, 
      start_date: Date.parse("2019-02-03"),
      end_date: Date.parse("2019-02-05"))
      
    @hotel_system = Hotel::Hotel_System.new(rooms: rooms, 
    reservation: reservation)
  end

  describe "Hotel_System instantiation" do
    it "is an instance of Hotel" do
      expect(@hotel_system).must_be_kind_of Hotel::Hotel_System
    end

    it "stores an array of room numbers" do
      expect(@hotel_system.rooms[0]).must_be_kind_of Integer
    end

    it "stores an instance of reservation" do 
      expect(@hotel_system.reservation).must_be_kind_of Hotel::Reservation
    end
  end 

  describe "list_rooms" do
    it "returns a list of all the rooms in the hotel" do

      expect(@hotel_system.list_rooms).must_be_kind_of Array
      expect(@hotel_system.list_rooms.length).must_equal 20
      expect(@hotel_system.list_rooms[0]).must_be_kind_of Integer
    end
  end

  describe "reservation" do
    it "calls the Reservation class to make a reservation when given a date range" do

      room = 3
      start_date = Date.parse("2019-02-03")
      end_date = Date.parse("2019-02-05")

      @reservation = Hotel::Reservation.new(
        room: room, 
        start_date: start_date,
        end_date: end_date,
      )
      
      @hotel_system.reservation?(3, Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      expect(@hotel_system.reservation.total_reservations.length).must_equal 1 
    end 
  end

  describe "list_available_rooms" do
    it "lists available rooms for a given date" do
      room = 3
      start_date = Date.parse("2019-02-03")
      end_date = Date.parse("2019-02-05")

      @reservation = Hotel::Reservation.new(
        room: room, 
        start_date: start_date,
        end_date: end_date,
      )
      
      @hotel_system.reservation?(3, Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      @hotel_system.list_reserved_room_numbers(Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      result = @hotel_system.list_available_rooms(Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      expect(result.length).must_equal 19
    end 
  end 

  describe "list_reserved_room_numbers" do
    it "returns reserved room numbers" do
      room = 3
      start_date = Date.parse("2019-02-03")
      end_date = Date.parse("2019-02-05")

      @reservation = Hotel::Reservation.new(
        room: room, 
        start_date: start_date,
        end_date: end_date,
      )
      
      @hotel_system.reservation?(3, Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      result = @hotel_system.list_reserved_room_numbers(Date.parse("2019-02-03"), Date.parse("2019-02-05"))
      expect(result[0]).must_equal 3
    end 
  end
end 

