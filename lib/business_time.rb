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

    def company(name, &block)
      config = BusinessTime::Config.company_config(name)
      config.merge!("company" => name)
      BusinessTime::Config.with(config) do
        yield
      end
    end
    alias_method :region, :company

  end
end
