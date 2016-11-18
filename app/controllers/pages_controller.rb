class PagesController < ApplicationController

  def home
    @products = Product.all.limit(6)
    @initial_images = @products.map{|p| p.images.map{|i| i.file.url}}.flatten
  end

  def contacts
  end
end
