module BusinessTime
  module Sequences
    def next_business_day
      next_day = 1.business_day.after(self)
      Time.beginning_of_workday(next_day)
    end

    def previous_business_day
      previous_day = 1.business_day.before(self)
      Time.beginning_of_workday(previous_day)
    end
  end
end
