class V1::StatesController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :update, :destroy]

  def index
    @states = current_app.states.all
    render json: @states
  end

  def show
    @state = current_app.states.find(params[:id])

    render json: @state
  end


  def create
    @state = current_app.states.new(params[:state])

    if @state.save
      render json: @state, status: :created, location: @state
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  def update
    @state = current_app.states.find(params[:id])

    if @state.update_attributes(state_params)
      head :no_content
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @state = current_app.states.find(params[:id])
    @state.destroy

    head :no_content
  end

  private

  def state_params
    params[:state].delete(:created_at)
    params[:state].delete(:updated_at)
    params[:state].delete(:id)
    params[:state].delete(:application_id)
    params[:state]
  end
end
