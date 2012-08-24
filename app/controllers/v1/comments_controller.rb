class V1::CommentsController < ApplicationController

  def index
    @comments = Comment.all

    render json: @comments
  end

  def show
    @comment = Comment.find(params[:id])

    render json: @comment
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(params[:comment])
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    head :no_content
  end
end
