require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should not create product without a name" do
  	product = Product.new
  	assert_not product.save
  end

  test "should not create product with duplicate name-company pair" do
  	product = Product.new
  	product.name = "APX 1000"
  	product.company = companies(:motorola_solutions)
  	assert_not product.save
  end

  test "should create product with duplicate name but different company" do
  	product = Product.new
  	product.name = "APX 1000"
  	product.company = companies(:vertex_standard)
  	assert product.save
  end
  
end
