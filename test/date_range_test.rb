require_relative "test_helper"
require "date"

describe "Date_Range" do
  describe "initialize" do
    it "Create an instance of Date_Range" do
      #Arrange
      start_date = Date.parse("2019-02-03")
      end_date = Date.parse("2019-02-01")
      #Act
      date_range = Hotel::Date_Range.new(start_date, end_date)
      #Assert
      expect(date_range).must_be_kind_of Hotel::Date_Range
    end 
  end 
end