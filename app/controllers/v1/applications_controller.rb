class V1::ApplicationsController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :update, :destroy]

  def index
     @applications = Application.all
     render json: @applications
  end

  def show
    @application = Application.find params[:id]
    render json: @application
  end

  def create
    @application = Application.new params[:application]
    render json: if @application.save
        @application
      else
        @application.errors
      end
  end

  def update
    @application = Application.find params[:id]
    render json: if @application.update_attributes params[:application]
        @application
      else
        @application.errors
      end
  end

  def destroy
    @application = Application.find params[:id]
    render json: @application.destroy
  end
end
