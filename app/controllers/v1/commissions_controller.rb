class V1::CommissionsController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :update, :destroy]

  def index
    @commissions = current_app.commissions.all

    render json: @commissions
  end


  def show
    @commission = current_app.commissions.find(params[:id])

    render json: @commission
  end

  def create
    @commission = current_app.commissions.new(params[:commission])

    if @commission.save
      render json: @commission, status: :created, location: @commission
    else
      render json: @commission.errors, status: :unprocessable_entity
    end
  end

  def update
    @commission = current_app.commissions.find(params[:id])

    if @commission.update_attributes(commission_params)
      head :no_content
    else
      render json: @commission.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @commission = current_app.commissions.find(params[:id])
    @commission.destroy

    head :no_content
  end

  private

  def commission_params
    params[:commission].delete(:created_at)
    params[:commission].delete(:updated_at)
    params[:commission].delete(:application_id)
    params[:commission].delete(:id)
    params[:commission]
  end

end
