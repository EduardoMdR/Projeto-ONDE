class CouponsController < ApplicationController
  ##### Autenticação #####
  before_action :require_owner_or_admin, only: %i[new create]
  before_action :require_owner_or_admin_coupon, only: %i[edit update destroy]

  ##### SHOW #####
  def index
    @coupons = Coupon.all
  end

  ###### CREATE #####
  def new
    @coupon = Coupon.new
  end
  
  def create
    @coupon = Coupon.new(coupon_params)
    @coupon.company = Company.find params[:id]
    begin
      @coupon.save!
      flash[:notice] = "Cupom #{@coupon.name} criado com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to coupons_path
    end
  end

  ##### UPDATE #####
  def edit
    @coupon = Coupon.find(params[:id])
  end
  
  def update
    @coupon = Coupon.find(params[:id])
    begin
      @coupon.update!(coupon_params)
      flash[:notice] = "Cupom #{@coupon.name} atualizado com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to coupons_path
    end
  end

  ##### DELETE #####
  def destroy
    @coupon = Coupon.find(params[:id])
    begin
      @coupon.destroy!
      flash[:notice] = "Cupom #{@coupon.name} apagado com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to coupons_path
    end
  end

  # ADD IN A PRIVATE METHOD FOR COUPONS_PARAMS
  private
    def coupon_params
      params.require(:coupon).permit(:name, :value, :description, :start_time, :end_time)
    end
end
