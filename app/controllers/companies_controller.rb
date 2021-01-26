class CompaniesController < ApplicationController
  ##### Autenticação #####

  ##### SHOW #####
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @reviews = Review.where(company: @company)
    @offers = Offer.where(company: @company)
    @score, @price = calc_score(@company, @review)
  end

  ###### CREATE #####
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    begin
      @company.save!
      @company.update(qtdscore: 0)
      flash[:notice] = "Empresa #{@company.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to companies_path
    end
  end

  ##### UPDATE #####
  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    begin
      @company.update!(company_params)
      flash[:notice] = "Empresa #{@company.name} atualizada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to companies_path
    end
  end

  ##### DELETE #####
  def destroy
    @company = Company.find(params[:id])
    begin
      @company.destroy!
      flash[:notice] = "Empresa #{@company.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to companies_path
    end
  end

  # ADD IN A PRIVATE METHOD FOR COMPANIES_PARAMS
  private
    def company_params
      params.require(:company).permit(:name, :description, :user_id, :phone, :fb_link, :maps, :subcategory_id)
    end
end
