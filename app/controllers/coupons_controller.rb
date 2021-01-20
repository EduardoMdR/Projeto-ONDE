class CouponsController < ApplicationController
  ##### Autenticação #####

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
      params.require(:coupon).permit(:name, :value, :code, :company_id, :start_time, :end_time)
    end
end
