class PaymentsController < ApplicationController
  before_action :set_payment, only: [:new, :update]
  def index
    @payments = Project.find(params[:project_id]).payments
  end

  def edit; end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to @payment
    else
      flash[:alert] = "Payment not saved"
      render "new"
    end
  end

  def update
    if @payment.update_attributes(payment_params)
      redirect_to @payment
    end
  end

  def destroy
    Payment.find(params[:id]).destroy
    flash[:success] = "Payment deleted"
    redirect_to root_path
  end

  private

  def payment_params
    params.require(:payment).permit(:type, :quantity, :unity)
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end
