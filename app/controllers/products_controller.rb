class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:index, :create]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :create, :destroy]

  def index
    @products = @category.products.paginate(page: params[:page], per_page: 6)
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def new
    @product = Product.new
    @image = @product.images.build
  end

  def edit
  end

  def create
    @product = @category.products.build(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Продукт був успішно створений' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to category_product_path(@product.category, @product), notice: 'Продукт був успішно збережений' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, images_attributes: [:product_id, :url])
  end
end
