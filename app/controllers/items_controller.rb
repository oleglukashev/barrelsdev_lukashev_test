class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
    @new_item = Item.new
  end


  def create
    @item = Item.new item_params

    if @item.save
      render json: { item: @item }, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end


  def update
    if @item.update item_params
      render json: { item: @item }, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end


  def destroy
    if @item.destroy
      render json: {}, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
        :name, 
        :picture
      )
    end
end
