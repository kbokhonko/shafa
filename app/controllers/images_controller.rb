class ImagesController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @images = @product.images
  end

  def new
    @product = Product.find(params[:product_id])
    @image = @product.images.build
  end

  def create
    @product = Product.find(params[:product_id])
    @image = @product.images.build(images_params)

    respond_to do |format|
      if @image.save!
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def images_params
      params.require(:image).permit(:file)
    end
end
