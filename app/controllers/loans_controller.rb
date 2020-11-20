class LoansController < ApplicationController
  before_action :get_requester

  def index
    @loans = @requester.loans
  end

  def new
    @loan = @requester.loans.build
  end

  def create
    @loan = @requester.loans.build(loan_params)
    if @loan.save
      redirect_to @requester, notice: 'Emprestimo solicitado com sucesso!'
    else
      render :new
    end
  end

  def show
    @loan = Loan.find(params[:id])
  end

  private

  def loan_params
    params.require(:loan).permit(:value, :fee, :month, :requester_id)
  end

  def load_requester
    @requesters = Requester.all
  end

  def get_requester
    @requester = Requester.find(params[:requester_id])
  end

end