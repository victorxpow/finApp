class RequestersController < ApplicationController
  def index
    @requesters = Requester.all
  end

  def new
    @requester = Requester.new
  end

  def create
    @requester = Requester.new(requester_params)
    if @requester.save
      redirect_to @requester, notice: 'Solicitante registrado com sucesso!'
    else
      render :new
    end
  end

  def show
    @requester = Requester.find(params[:id])
  end

  private

  def requester_params
    params.require(:requester).permit(:company_name, :cnpj, :phone, :address, :value)
  end

end