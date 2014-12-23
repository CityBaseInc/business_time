require 'thread'
require 'active_support'
require 'active_support/time'
require 'time'
require 'yaml'
require 'holidays'

require 'business_time/config'
require 'business_time/sequences'
require 'business_time/business_hours'
require 'business_time/business_days'
require 'business_time/core_ext/date'
require 'business_time/core_ext/fixnum'

require 'business_time/time_extensions'
require 'business_time/core_ext/time'
require 'business_time/core_ext/active_support/time_with_zone'

module BusinessTime
  class << self

    def region(name, &block)
      old_region = BusinessTime::Config.region
      BusinessTime::Config.region = name
      yield
    ensure
      BusinessTime::Config.region = old_region
    end
    alias_method :brand, :region

  end
end
