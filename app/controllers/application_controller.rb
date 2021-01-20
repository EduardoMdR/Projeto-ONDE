class ApplicationController < ActionController::Base
  def restrict_access
    flash[:error] = 'Você não tem permissão para acessar essa página!'
    redirect_to login_path
  end

  def require_admin
    restrict_access unless current_user&.admin?
  end
  def require_company
    restrict_access unless current_user&.company?
  end

  def calc_score(company, review)
    if company.qtdscore == 0
      return [5, 3]
    end
    qtd_score = 0.0
    qtd_price = 0.0
    review = Review.where(company: company)

    review.each do |item|
      qtd_score = qtd_score + item.score
      qtd_price = qtd_price + item.price
    end
    score = qtd_score / company.qtdscore
    price = qtd_price / company.qtdscore
    return [score.round(1), price.round(1)]
  end

  def calc_score_offer(offer)
    if offer.qtdscore == 0
      return 5
    end
    qtd_score = 0.0
    review = ReviewOffer.where(offer: offer)
    review.each do |item|
      qtd_score = qtd_score + item.score
    end
    score = qtd_score / offer.qtdscore
    return score.round(1)
  end
end
