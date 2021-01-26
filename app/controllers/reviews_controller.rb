class ReviewsController < ApplicationController
  ##### Autenticação #####

  ###### CREATE #####
  def new
    restrain_new_review(Company.find params[:id])
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.company = Company.find params[:id]
    begin
      @review.save!
      qtd_review(@review, 1)
      flash[:notice] = "Review #{@review.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to show_company_path(@review.company)
    end
  end

  def restrain_new_review(company)
    review = Review.where(:user_id => current_user.id, :company => company).first
    if review.present?
      redirect_to edit_review_path(review.id)
    end
  end

  def qtd_review(review, somar)
    @company = review.company
    @qtd = @company.qtdscore
    if somar == 1
      @qtd = @qtd + 1
    else
      @qtd = @qtd - 1
    end
    @company.update(qtdscore: @qtd)
  end

  ##### UPDATE #####
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    begin
      @review.update!(review_params)
      flash[:notice] = "Review #{@review.name} atualizada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to show_company_path(@review.company)
    end
  end

  ##### DELETE #####
  def destroy
    @review = Review.find(params[:id])
    begin
      @review.destroy!
      qtd_review(@review, 0)
      flash[:notice] = "Review #{@review.name} apagada com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to show_company_path(@review.company)
    end
  end

  # ADD IN A PRIVATE METHOD FOR REVIEW_PARAMS
  private
    def review_params
      params.require(:review).permit(:score, :price, :description)
    end
end
