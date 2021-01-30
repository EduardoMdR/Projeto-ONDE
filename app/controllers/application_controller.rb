class ApplicationController < ActionController::Base
  def restrict_access
    flash[:error] = 'Você não tem permissão para acessar essa página!'
    redirect_to root_path
  end
  def require_admin
    restrict_access unless current_user&.role_id == 1
  end
  def require_company
    restrict_access unless current_user&.role_id == 2 || current_user&.role_id == 1
  end
  def require_logged_in
    restrict_access unless current_user&.present?
  end
  def require_self_or_admin
    u = User.find(params[:id])
    restrict_access unless (u == current_user) || current_user.role_id == 1
  end

  def require_owner_or_admin
    c = Company.find(params[:id])
    restrict_access unless (c.user == current_user) || current_user.role_id == 1
  end

  def restrain_new_company
    company = Company.where(:user_id => current_user).first
    if company.present?
      redirect_to edit_company_path(company)
    end
  end

  # calcular pontuação
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
