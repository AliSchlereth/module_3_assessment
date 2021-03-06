class Api::V1::ItemsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
      item = Item.new(item_params)
      if item.save
        render json: item, status: 201
      else
        render json: {message: "Unable to create item"}, status: 400
      end
  end

  def destroy
    item = Item.find(params[:id])
    if item.delete
      render json: item
    else
      render json: {message: "Unable to delete item."}, status: 404
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end


end
