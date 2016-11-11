class PagesController < ApplicationController

  def home
    @products = Product.all.limit(4)
  end

  def contacts
  end
end
