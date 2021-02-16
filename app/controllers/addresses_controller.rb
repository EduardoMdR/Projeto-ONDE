class AddressesController < ApplicationController
  before_action :require_logged_in
  before_action :require_address_owner, only: %i[edit update destroy]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    begin
      @address.save!
      flash[:success] = 'Endereço criado com sucesso!'
      redirect_to show_user_path current_user
    rescue StandardError => e
      flash[:error] = e.message
      puts "deu erro \n\n #{e}\n\n"
      redirect_back fallback_location: show_user_path(current_user)
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])

    begin
      @address.update!(address_params)
      flash[:success] = 'Endereço atualizado com sucesso!'
      redirect_to show_user_path current_user
    rescue StandardError => e
      flash[:error] = e.message
      redirect_back fallback_location: show_user_path(current_user)
    end
  end

  def destroy
    @address = Address.find(params[:id])

    begin
      @address.destroy!
      flash[:notice] = 'Endereço removido da sua lista de endereços!'
    rescue StandardError => e
      flash[:error] = e.message
    end
    redirect_back fallback_location: show_user_path(current_user)
  end

  private

  def address_params
    params.require(:address).permit(
      :address_line, :number, :cep, :city, :state,
      :complement, :recipient_name, :phone_number
    ).merge(user: current_user)
  end
end
