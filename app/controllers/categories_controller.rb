class CategoriesController < ApplicationController
  ##### Autenticação #####
  before_action :require_admin, only: %i[new create edit update destroy]

  ##### SHOW #####
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = Subcategory.where(category: @category)
  end

  ###### CREATE #####
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    begin
      @category.save!
      flash[:notice] = "Categoria #{@category.name} criada com sucesso"
      redirect_to show_category_path(@category)
    rescue => exception
      flash[:notice] = exception
      redirect_to categories_path
    end
  end

  ##### UPDATE #####
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    begin
      @category.update!(category_params)
      flash[:notice] = "Categoria #{@category.name} atualizada com sucesso"
      redirect_to show_category_path(@category)
    rescue => exc
      flash[:notice] = exc
      redirect_to categories_path
    end
  end

  ##### DELETE #####
  def destroy
    @category = Category.find(params[:id])
    begin
      @category.destroy!
      flash[:notice] = "Categoria #{@category.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to categories_path
    end
  end

  # ADD IN A PRIVATE METHOD FOR CATEGORIES_PARAMS
  private
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
