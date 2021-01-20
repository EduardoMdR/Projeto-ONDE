class ReviewOffersController < ApplicationController
  ##### Autenticação #####

  ##### SHOW #####
  def index
    @review_offers = ReviewOffer.all
  end

  ###### CREATE #####
  def new
    @review_offer = ReviewOffer.new
  end
  
  def create
    @review_offer = ReviewOffer.new(review_offer_params)
    begin
      @review_offer.save!
      qtd_review_offer(@review_offer, 1)
      flash[:notice] = "Review para #{@review_offer.offer.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to review_offers_path
    end
  end

  def qtd_review_offer(review, somar)
    @offer = review.offer
    @qtd = @offer.qtdscore
    if somar == 1
      @qtd = @qtd + 1
    else
      @qtd = @qtd - 1
    end
    @offer.update(qtdscore: @qtd)
  end

  ##### UPDATE #####
  def edit
    @review_offer = ReviewOffer.find(params[:id])
  end
  
  def update
    @review_offer = ReviewOffer.find(params[:id])
    begin
      @review_offer.update!(review_offer_params)
      flash[:notice] = "Review para #{@review_offer.offer.name} atualizada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to review_offers_path
    end
  end

  ##### DELETE #####
  def destroy
    @review_offer = ReviewOffer.find(params[:id])
    begin
      @review_offer.destroy!
      qtd_review_offer(@review_offer, 0)
      flash[:notice] = "Review para #{@review_offer.offer.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to review_offers_path
    end
  end

  # ADD IN A PRIVATE METHOD FOR REVIEW_OFFER_PARAMS
  private
    def review_offer_params
      params.require(:review_offer).permit(:score, :user_id, :description, :offer_id)
    end
end
