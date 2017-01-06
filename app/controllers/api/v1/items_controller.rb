class Api::V1::ItemsController < ApplicationController

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
        render json: {message: "Unable to create item"}, status 404
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


end
