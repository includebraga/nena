class PaymentsController < ApplicationController
  before_action :set_payment, only: [:new, :update]

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      UserProjectPayment.create(user_id: params[:payment][:user_id], project_id: params[:payment][:project_id], payment_id: @payment.reload.id)
      redirect_to "/organizations/#{@payment.project.organization_id}/projects/#{@payment.project.id}"
    else
      flash[:alert] = "Payment not saved"
      render "new"
    end
  end

  def share
    @payment = Payment.new(type: "Share", quantity: 1.0, unit: "")
    if @payment.save
      UserProjectPayment.create(user_id: current_user.id, project_id: params[:project_id], payment_id: @payment.reload.id)

      flash[:notice] = "Share successful."
      redirect_to "/organizations/#{@payment.project.organization_id}/projects/#{@payment.project.id}"
    end
  end

  private

  def payment_base_params
    params.require(:payment).permit(:type, :quantity, :unit)
  end

  def payment_params
    payment_base_params.merge({
      quantity: payment_base_params[:quantity].to_f,
      type: payment_base_params[:type].capitalize,
    })
  end

  def set_payment
    @payment = Payment.find(params[:id])
  end
end
