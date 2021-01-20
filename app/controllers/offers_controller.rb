class OffersController < ApplicationController
  ##### Autenticação #####

  ##### SHOW #####
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @review_offers = ReviewOffer.where(offer: @offer)
    @score = calc_score_offer(@offer)
  end

  ###### CREATE #####
  def new
    @offer = Offer.new
  end
  
  def create
    @offer = Offer.new(offer_params)
    begin
      @offer.save!
      @offer.update(qtdscore: 0)
      flash[:notice] = "Oferta #{@offer.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to offers_path
    end
  end

  ##### UPDATE #####
  def edit
    @offer = Offer.find(params[:id])
  end
  
  def update
    @offer = Offer.find(params[:id])
    begin
      @offer.update!(offer_params)
      flash[:notice] = "Oferta #{@offer.name} atualizada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to offers_path
    end
  end

  ##### DELETE #####
  def destroy
    @offer = Offer.find(params[:id])
    begin
      @offer.destroy!
      flash[:notice] = "Oferta #{@offer.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to offers_path
    end
  end

  # ADD IN A PRIVATE METHOD FOR OFFERS_PARAMS
  private
    def offer_params
      params.require(:offer).permit(:name, :description, :old_price,:new_price, :start_time, 
         :end_time, :company_id, :parceled, :qtd_parcel, :cash, :credit_card)
    end
end
