class V1::RepresentativesController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :update, :destroy]

  def index
    @representatives = current_app.representatives
    render json: @representatives
  end

  def show
    @representative = current_app.representatives.find params[:id]
    render json: @representative
  end

  def create
    @representative = current_app.representatives.new representative_params

    if @representative.save
      render json: @representative, status: :created, location: @commission
    else
      render json: @representative.errors, status: :unprocessable_entity
    end
  end

  def update
    @representative = current_app.representatives.find params[:id]

    if @representative.update_attributes(representative_params)
      render json: @commission
    else
      render json: @commission.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @representative = current_app.representatives.find params[:id]
    @representative.destroy

    head :no_content
  end

  private
  def representative_params
    params[:representative].delete(:created_at)
    params[:representative].delete(:updated_at)
    params[:representative].delete(:application_id)
    params[:representative].delete(:id)
    params[:representative]
  end

end
