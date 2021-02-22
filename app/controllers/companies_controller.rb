class CompaniesController < ApplicationController
  ##### Autenticação #####
  before_action :require_company, only: %i[new create edit update destroy]
  before_action :restrain_new_company, only: %i[new create]
  before_action :require_owner_or_admin, only: %i[dashboard offers_index coupons_index edit update destroy]
  layout 'admin_page_layout', only: %i[dashboard offers_index coupons_index]

  ##### SHOW #####
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @reviews = Review.where(company: @company)
    @offers = Offer.where(company: @company)
    @coupons = Coupon.where(company: @company)
    @score, @price = calc_score(@company, @review)
  end

  def dashboard
  end

  def offers_index
    @offers = Offer.where(company_id: params[:id]) 
  end
  def coupons_index
    @coupons = Coupon.where(company_id: params[:id]) 
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
