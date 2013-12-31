class InventoriesController < ApplicationController

  def index
    @inventories = Inventory.all.order(:title)
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inv_params)
    if @inventory.save
      redirect_to @inventory, notice: 'Inventory has successfully saved!'
    else
      render action:'new'
    end
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  private
  def inv_params
    params.require(:inventory).permit(:title,:description,:quantity)
  end
end
