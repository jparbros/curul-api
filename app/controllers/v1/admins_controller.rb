class V1::AdminsController < ApplicationController

  def index
    @admins = Admin.where(application_id: params[:application_id])
    render json: @admins
  end

  def show
    @admin = Admin.find params[:id]
    render json: @admin
  end
end
