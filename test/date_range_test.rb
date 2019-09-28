require_relative "test_helper"
require "date"

describe "Date_Range" do
  before do

    start_date = Date.parse("2019-02-03")
    end_date = Date.parse("2019-02-05")

    @date_range = Hotel::Date_Range.new(
      start_date: start_date,
      end_date: end_date
    )
  end 

  describe "Date_Range instantiation" do
    it "is an instance of Date_Range" do
      expect(@date_range).must_be_kind_of Hotel::Date_Range
    end 

    it "throws an argument error if start date is after end date" do
      start_date = Date.parse("2019-02-05")
      end_date = Date.parse("2019-02-04")

      expect{Hotel::Date_Range.new(start_date: start_date, end_date: end_date)}.must_raise ArgumentError
    end
  end 

  describe "calculate_cost_of_stay" do
    it "returns the cost of the duration of stay" do
      result = @date_range.calculate_cost_of_stay

      expect(result).must_equal 400
    end
  end
end