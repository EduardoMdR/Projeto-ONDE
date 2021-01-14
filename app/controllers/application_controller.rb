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
end
