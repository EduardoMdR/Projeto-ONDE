class SessionsController < ApplicationController
  def new
  end

  def create
    if login_user
      flash[:success] = "Seja bem-vindo!"
      redirect_to root_path
    else
      flash[:error] = "Dados inválidos. Tente novamente."
      redirect_back fallback_location: login_path
    end
  end

  def destroy
    logout
    flash[:success] = 'Você saiu com sucesso.'
    redirect_to root_path
  end

  private
    # Realiza login com os parametros
    def login_user
      login(params[:email], params[:password])
      # , params[:remember]
    end
end
