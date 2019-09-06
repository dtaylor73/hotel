require_relative "test_helper"
require "Pry"

describe "Hotel_System" do 
  before do 
    #Arrange
    rooms = [Hotel::Room.new(room_number: 2, room_cost: 200)]
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
    # binding.pry
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
end 
