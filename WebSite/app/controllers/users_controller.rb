class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    begin
      @user.save!
      flash[:success] = 'Cadastro realizado com sucesso!'
      redirect_to root_path
    rescue => exception
      flash[:error] = exception.message
      redirect_back fallback_location: new_user_path
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
    def users_params
        params.require('user').permit(:name, :email, :password, :role_id)
    end
end
