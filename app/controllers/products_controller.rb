class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy, :upload_images]
  # before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/slug-here
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/slug-here
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/slug-here
  def destroy
    @product.destroy
  end

  def upload_images
    @product.images.attach(params.require(:images))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by!(slug: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :identifier, :slug, :description, :stock, :price, :images, :category_id, :user_id)
    end
end
