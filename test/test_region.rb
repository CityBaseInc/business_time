require File.expand_path('../helper', __FILE__)

describe "#region" do
  it "sets region in block" do
    BusinessTime.region :ca do
      assert_equal "ca", BusinessTime::Config.region
    end
  end

  it "uses region" do
    day = Date.parse("July 1, 2008")
    BusinessTime.region :ca do
      assert(!day.workday?) # holiday in Canada
    end
    BusinessTime.region :us do
      assert(day.workday?) # workday in USA
    end
  end

  it "resets region after the block" do
    BusinessTime::Config.region = "ca"
    BusinessTime.region "tep" do; end
    assert_equal "ca", BusinessTime::Config.region
  end
end
