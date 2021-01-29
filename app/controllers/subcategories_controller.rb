class SubcategoriesController < ApplicationController
  ##### Autenticação #####
  before_action :require_admin, only: %i[new create edit update destroy]

  ###### SHOW #####
  def show
    @subcategory = Subcategory.find(params[:id])
    @companies = Company.where(subcategory: @subcategory)
  end

  ###### CREATE #####
  def new
    @subcategory = Subcategory.new
  end
  
  def create
    @subcategory = Subcategory.new(subcategory_params)
    @subcategory.category = Category.find params[:id]
    begin
      @subcategory.save!
      flash[:notice] = "Sub Categoria #{@subcategory.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to show_subcategory_path(@subcategory)
    end
  end

  ##### UPDATE #####
  def edit
    @subcategory = Subcategory.find(params[:id])
  end
  
  def update
    @subcategory = Subcategory.find(params[:id])
    begin
      @subcategory.update!(subcategory_params)
      flash[:notice] = "Sub Categoria #{@subcategory.name} atualizada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to show_subcategory_path(@subcategory)
    end
  end

  ##### DELETE #####
  def destroy
    @subcategory = Subcategory.find(params[:id])
    begin
      @subcategory.destroy!
      flash[:notice] = "Sub Categoria #{@subcategory.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to delete_category_path(@subcategory.category)
    end
  end

  # ADD IN A PRIVATE METHOD FOR CATEGORIES_PARAMS
  private
    def subcategory_params
      params.require(:subcategory).permit(:name, :description)
    end
end
