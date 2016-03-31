require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create product without a name" do
  	product = Product.new
  	assert_not product.save
  end

  
end
