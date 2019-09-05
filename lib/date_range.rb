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


# expect {Card.new(14, :clovers)}.must_raise ArgumentError

# if (value > 13 || value < 1) || (suit_array.include?(suit) == false)
#   raise ArgumentError, "You must provide a value 1..13 or suit
#   (:hearts, :spades, :clubs, :diamonds)"
# end 