require_relative "test_helper"
require "date"
# date is year-month-day

describe "Date_Range" do
  describe "Date_Range instantiation" do
    before do
      #Arrange
      start_date = Date.parse("2019-02-03")
      end_date = Date.parse("2019-02-05")

      #Act
      @date_range = Hotel::Date_Range.new(
        start_date: start_date,
        end_date: end_date
      )
    end 
    
    it "is an instance of Date_Range" do
      #Assert
      expect(@date_range).must_be_kind_of Hotel::Date_Range
    end 

    it "throws an argument error if start date is after end date" do
      #Arrange
      start_date = Date.parse("2019-02-05")
      end_date = Date.parse("2019-02-04")

      #Assert
      expect{Hotel::Date_Range.new(start_date: start_date, end_date: end_date)}.must_raise ArgumentError
      # when you initialize, it throws the argument error. This is why we instantiate Date_Range in the expect block.
    end
  end 
end