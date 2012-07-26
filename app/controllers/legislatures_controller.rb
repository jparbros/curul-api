class LegislaturesController < ApplicationController
  def index
    @legislatures = Legislature.all
    render json: @legislatures
  end

  def create
    @legislatures = Legislature.new(params[:legislature])
    render json: @legislatures
  end

  def update
    @legislature = Legislature.find(params[:id])
    @legislature.update_atributes(params[:legislature])
    render json: @legislature
  end
end
