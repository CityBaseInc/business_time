require File.expand_path('../helper', __FILE__)

describe "date extensions" do
  it "know a weekend day is not a workday"  do
    assert(Date.parse("April 9, 2010").workday?)
    assert(!Date.parse("April 10, 2010").workday?)
    assert(!Date.parse("April 11, 2010").workday?)
    assert(Date.parse("April 12, 2010").workday?)
  end

  it "know a weekend day is not a workday (with a configured work week)"  do
    BusinessTime::Config.work_week = %w[sun mon tue wed thu]
    assert(Date.parse("April 8, 2010").weekday?)
    assert(!Date.parse("April 9, 2010").weekday?)
    assert(!Date.parse("April 10, 2010").weekday?)
    assert(Date.parse("April 12, 2010").weekday?)
  end

  it "know a holiday is not a workday" do
    july_4 = Date.parse("July 4, 2010")
    july_5 = Date.parse("July 5, 2010")

    assert(!july_4.workday?)
    assert(july_5.workday?)

    BusinessTime::Config.holidays << july_4
    BusinessTime::Config.holidays << july_5

    assert(!july_4.workday?)
    assert(!july_5.workday?)
  end

  it "know a holiday is not a workday for region" do
    BusinessTime.region :us do
      holiday = Date.parse("July 3, 2015")  # Holiday in US
      assert !holiday.workday?
    end
  end

  # =================== sequences ======================

  it "starts next day at the morning" do
    thursday = Date.parse("July 3, 2008")
    friday_morning = Time.parse("July 4, 2008 9:00")
    assert_equal friday_morning, thursday.next_business_day
  end

  it "starts previous day at the morning" do
    thursday = Date.parse("July 3, 2008")
    wednesday_morning = Time.parse("July2, 2008 9:00")
    assert_equal wednesday_morning, thursday.previous_business_day
  end
end
