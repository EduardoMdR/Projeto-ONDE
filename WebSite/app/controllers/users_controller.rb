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
      flash[:error] = e.message
      render 'new'
    end
  end

  private
    def users_params
        params.require('user').permit(:name, :email, :password, :role_id)
    end
end
