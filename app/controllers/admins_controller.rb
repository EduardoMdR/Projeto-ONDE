class AdminsController < ApplicationController
  before_action :require_admin

  def company_index
    @companies = Company.all
  end
end
