module BusinessTime
  module Sequences
    def next_business_day
      next_day = self + 1.day
      while !Time.workday?(next_day)
        next_day = next_day + 1.day
      end
      Time.beginning_of_workday(next_day)
    end

    def previous_business_day
      previous_day = self - 1.day
      while !Time.workday?(previous_day)
        previous_day = previous_day - 1.day
      end
      Time.beginning_of_workday(previous_day)
    end
  end
end
