class V1::LegislaturesController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :update, :destroy]

  def index
    @legislatures = current_app.legislatures
    render json: @legislatures
  end

  def show
    @legislature = current_app.legislatures.find(params[:id])
    render json: @legislature
  end

  def create
    @legislature = current_app.legislatures.new(params[:legislature])
    render json: if @legislature.save
        @legislature
      else
        @legislature.error
      end
  end

  def update
    @legislature = current_app.legislatures.find(params[:id])
    render json: if @legislature.update_attributes(legislature_params)
      @legislature
    else
      @legislature.error
    end
  end

  def destroy
    @legislature = current_app.legislatures.find(params[:id])
    render json: @legislature.destroy
  end

  private

  def legislature_params
    params[:legislature].delete(:created_at)
    params[:legislature].delete(:updated_at)
    params[:legislature].delete(:id)
    params[:legislature]
  end
end
