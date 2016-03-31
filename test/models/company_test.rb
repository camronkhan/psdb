require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create company without name" do
  	company = Company.new
  	assert_not company.save
  end

  test "should not create company with duplicate name" do
  	company = Company.new
  	company.name = "Motorola Solutions"
  	assert_not company.save
  end

end