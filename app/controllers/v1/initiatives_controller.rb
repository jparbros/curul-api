class V1::InitiativesController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :update, :destroy]

  def index
    @initiatives = Searches::Initiatives.new(params[:search], params[:page]).initiatives

    render json: @initiatives
  end

  def show
    @initiative = Initiative.find(params[:id])

    render json: @initiative
  end

  def create
    @initiative = Initiative.new(params[:initiative])

    if @initiative.save
      render json: @initiative, status: :created, location: @initiative
    else
      render json: @initiative.errors, status: :unprocessable_entity
    end
  end

  def update
    @initiative = Initiative.find(params[:id])

    if @initiative.update_attributes(params[:initiative])
      render json: @initiative
    else
      render json: @initiative.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @initiative = Initiative.find(params[:id])
    @initiative.destroy

    head :no_content
  end
end
