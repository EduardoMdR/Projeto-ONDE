class SubcategoriesController < ApplicationController

  ##### Autenticação #####

  ###### CREATE #####
  def new
    @subcategory = Subcategory.new
  end
  
  def create
    @subcategory = Subcategory.new(subcategory_params)
    begin
      @subcategory.save!
      flash[:notice] = "Sub Categoria #{@subcategory.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to category_path(@subcategory.category)
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
      redirect_to category_path(@subcategory.category)
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
      redirect_to category_path(@subcategory.category)
    end
  end

  # ADD IN A PRIVATE METHOD FOR CATEGORIES_PARAMS
  private
    def subcategory_params
      params.require(:subcategory).permit(:name, :description, :category_id)
    end
end
