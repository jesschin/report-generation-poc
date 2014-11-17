class ProductDataController < ApplicationController
  def index
    @products = ProductData.all
  end
end
