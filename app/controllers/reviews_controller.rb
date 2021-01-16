class ReviewsController < ApplicationController
  ##### Autenticação #####

  ###### CREATE #####
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    begin
      @review.save!
      qtd_review(@review, 1)
      flash[:notice] = "Review #{@review.name} criada com sucesso"
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to company_path(@review.company)
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
      redirect_to company_path(@review.company)
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
      redirect_to company_path(@review.company)
    end
  end

  # ADD IN A PRIVATE METHOD FOR COMPANIES_PARAMS
  private
    def review_params
      params.require(:review).permit(:score, :price, :description, :company_id)
    end
end
