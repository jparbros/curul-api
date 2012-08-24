class V1::PoliticalPartiesController < ApplicationController
  before_filter :authenticate_admin!, only: [:create, :update, :destroy]

  def index
    @political_parties = current_app.political_parties
    render json: @political_parties
  end

  def show
    @political_party = current_app.political_parties.find params[:id]
    render json: @political_party
  end

  def create
    @political_party = current_app.political_parties.new params[:political_party]
    render json: if @political_party.save
        @political_party
      else
        @political_party.error
      end
  end

  def update
    @political_party = current_app.political_parties.find params[:id]
    render json: if @@political_party.update_attributes(political_party_params)
      @political_party
    else
      @political_party.error
    end
  end

  def destroy
    @political_party = current_app.political_parties.find(params[:id])
    render json: @political_party.destroy
  end

  private

  def political_party_params
    params[:political_party].delete(:created_at)
    params[:political_party].delete(:updated_at)
    params[:political_party].delete(:id)
    params[:political_party]
  end

end
