class FoodsController < ApplicationController
  ##### Autenticação #####
  before_action :require_owner_or_admin, only: %i[new create]
  before_action :require_owner_or_admin_food, only: %i[edit update destroy]

  ##### SHOW #####
  def index
    @foods = Offer.all
    @company = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @offers = Offer.where(company: @company)
  end

  ###### CREATE #####
  def new
    @food = Food.new
  end
  
  def create
    @food = Food.new(food_params)
    @food.company = Company.find params[:id]
    begin
      @food.save!
      @food.update(qtdscore: 0)
      flash[:notice] = "Comida #{@food.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to foods_path
    end
  end

  ##### UPDATE #####
  def edit
    @food = Food.find(params[:id])
  end
  
  def update
    @food = Food.find(params[:id])
    begin
      @food.update!(food_params)
      flash[:notice] = "Comida #{@food.name} atualizada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to foods_path
    end
  end

  ##### DELETE #####
  def destroy
    @food = Food.find(params[:id])
    begin
      @food.destroy!
      flash[:notice] = "Comida #{@food.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to foods_path
    end
  end

  # ADD IN A PRIVATE METHOD FOR OFFERS_PARAMS
  private
    def food_params
      params.require(:food).permit(:name, :description, :price, :old_price, :promotion?,
      :qtd_max, :avaliable?)
    end
end
