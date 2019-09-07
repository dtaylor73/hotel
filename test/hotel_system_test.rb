require_relative "test_helper"
require "Pry"
require "minitest/skip_dsl"

describe "Hotel_System" do 
  before do 
    #Arrange
    rooms = Hotel::Room.load_all
    reservations = 
      [
      Hotel::Reservation.new(id: 1, 
      room: Hotel::Room.new(room_number: 3, room_cost: 200), 
      date_range: Hotel::Date_Range.new(start_date: Date.parse("2019-02-03"),
      end_date: Date.parse("2019-02-05")))
      ]

    #Act
    @hotel_system = Hotel::Hotel_System.new(rooms: rooms, 
    reservations: reservations)
  end

  describe "Hotel_System instantiation" do
    it "is an instance of Hotel" do
      #Assert
      expect(@hotel_system).must_be_kind_of Hotel::Hotel_System
    end

    it "stores an instance of room" do
      expect(@hotel_system.rooms[0]).must_be_kind_of Hotel::Room
    end

    it "stores an instance of reservation" do 
      expect(@hotel_system.reservations[0]).must_be_kind_of Hotel::Reservation
    end
  end 

  describe "list_rooms" do
    it "returns a list of all the rooms in the hotel" do

      expect(@hotel_system.list_rooms).must_be_kind_of Array

      expect(@hotel_system.list_rooms.length).must_equal 20
      expect(@hotel_system.list_rooms[0]).must_be_kind_of Hotel::Room
    end
  end

  describe "make_reservation" do
    it "makes a reservation when given a date range" do
      #Arrange
      # start_date = @hotel_system.reservations[0].date_range.start_date
      # end_date = @hotel_system.reservations[0].date_range.end_date
      start_date = Date.parse("2019-02-08")
      end_date = Date.parse("2019-02-12")

      #Act
      result = @hotel_system.make_reservation(start_date, end_date)

      #Assert
      expect(result).must_be_kind_of Array
      expect(result[1]).must_be_kind_of Hotel::Reservation
      expect(result[1].date_range.start_date).must_equal start_date
      expect(result[1].date_range.end_date).must_equal end_date
    end 

    it "pushes a new reservation to Hotel_System's reservation instance variable" do 
      #Arrange
      # start_date = @hotel_system.reservations[0].date_range.start_date
      # end_date = @hotel_system.reservations[0].date_range.end_date
      start_date = Date.parse("2019-02-08")
      end_date = Date.parse("2019-02-12")

      #Act
      result = @hotel_system.make_reservation(start_date, end_date)

      #Assert
      expect(@hotel_system.reservations.length).must_equal 2
    end 
  end

  describe "find_reservation" do
    it "finds reservations booked for a specific date" do
      #Arrange
      start_date = Date.parse("2019-12-11")
      end_date = Date.parse("2019-12-17")
      
      #Act
      @hotel_system.make_reservation(start_date, end_date)
      result = @hotel_system.find_reservation(start_date, end_date)
      
      #Assert
      expect(result).must_be_kind_of Array
      expect(result[0]).must_be_kind_of Hotel::Reservation
      expect(result.length).must_equal 1
    end
  end
end 

# I can access the list of reservations for a specific date, so that I can track reservations 
# by date
