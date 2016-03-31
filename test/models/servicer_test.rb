require 'test_helper'

class ServicerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create servicer without a name" do
  	servicer = Servicer.new
  	assert_not servicer.save
  end

end
