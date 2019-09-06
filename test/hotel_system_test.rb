require_relative "test_helper"
require "Pry"

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

  # describe "make_reservation" do
  #   it "makes a reservation when given a date range" do
  #     #Act
  #     result = make_reservation(Date.parse("2019-03-05"), Date.parse("2019-03-07"))
  #     #Assert
  #     expect(@hotel_system.make_reservation).must_be_kind_of Hotel::Reservation
  #   end 

    # it "pushes new reservation to Hotel_System's array of reservations" do 
  #   # end 
  # end
end 
