module Hotel
  class Date_Range
    attr_reader  :start_date,  :end_date

    def initialize(start_date: , end_date:)
      @start_date = start_date
      @end_date = end_date

      raise ArgumentError, "start date cannot be after end date" if start_date > end_date
    end
  end
end 

