class UsersController < ApplicationController
  before_action :require_self_or_admin, only: %i[edit update destroy]
  before_action :require_admin, only: %i[index]
  before_action :set_user, only: [:show, :show_user_addresses, 
                :show_user_reviews, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def show_user_addresses
  end

  def show_user_reviews
    @reviews = Review.where(user: @user)
    @review_offers = ReviewOffer.where(user: @user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    unless current_user&.role_id == 1
      @user.role_id = 3
    end
    begin
      @user.save!
      flash[:success] = 'Cadastro realizado com sucesso!'
      redirect_to root_path
    rescue => exception
      flash[:error] = exception.message
      redirect_back fallback_location: new_user_path
    end
  end

  def edit
  end
  
  def update
    begin
      @user.update!(users_params)
      flash[:success] = 'Cadastro realizado com sucesso!'
      redirect_to root_path
    rescue => exception
      flash[:error] = exception.message
      redirect_back fallback_location: new_user_path
    end
  end

  def destroy
    begin
      @user.destroy!
      flash[:notice] = "Usuário #{@user.name} apagado com sucesso"
    rescue => exc
      flash[:notice] = exc
    ensure
      redirect_to root_path
    end
  end

  # Ativação por email
  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      flash[:success] = 'Usuário foi autenticado com sucesso.'
      redirect_to root_path
    else
      flash[:error] = 'Email ainda não autenticado'
      redirect_to root_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def users_params
        params.require('user').permit(:name, :email, :password, :role_id)
    end
end
