require 'test_helper'

class TechnologistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create technologist without a name" do
  	technologist = Technologist.new
  	assert_not technologist.save
  end

end
