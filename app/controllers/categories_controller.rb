class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy, :upload_image]
  # before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/slug-here
  def show
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/slug-here
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/slug-here
  def destroy
    @category.destroy
  end

  def upload_image
    @category.image.attach(params.require(:image))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find_by!(slug: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name, :identifier, :slug, :image)
    end
end
