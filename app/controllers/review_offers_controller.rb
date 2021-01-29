class ReviewOffersController < ApplicationController
  ##### Autenticação #####

  ##### SHOW #####
  def index
    @review_offers = ReviewOffer.where(user_id: current_user.id)
  end

  ###### CREATE #####
  def new
    restrain_new_review(Offer.find params[:id])
    @review_offer = ReviewOffer.new
  end
  
  def create
    @review_offer = ReviewOffer.new(review_offer_params)
    @review_offer.user_id = current_user.id
    @review_offer.offer = Offer.find params[:id]
    begin
      @review_offer.save!
      qtd_review_offer(@review_offer, 1)
      flash[:notice] = "Review para #{@review_offer.offer.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to show_offer_path(@review_offer.offer)
    end
  end

  def restrain_new_review(offer)
    review = ReviewOffer.where(:user_id => current_user.id, :offer => offer).first
    if review.present?
      redirect_to edit_review_offer_path(review.id)
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
      redirect_to show_offer_path(@review_offer.offer)
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
      redirect_to show_offer_path(@review_offer.offer)
    end
  end

  # ADD IN A PRIVATE METHOD FOR REVIEW_OFFER_PARAMS
  private
    def review_offer_params
      params.require(:review_offer).permit(:score, :description)
    end
end
