class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: Rails.configuration.admin[:user],
  password: Rails.configuration.admin[:password]
  def show
    @product_count=Product.all.count 
    @category_count=Category.all.count 
    products=Product.all

    @item_count = 0

    products.each do |item|
      @item_count = @item_count.to_i + item.quantity.to_i 
    end
  end
end
