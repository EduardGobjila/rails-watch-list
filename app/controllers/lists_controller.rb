class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
   @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path(@list)
  end

  def new
   @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

    def destroy
      @list = List.find(params[:id])
      @list.destroy
      redirect_to lists_path, notice: 'Restaurant was successfully destroyed.', status: :see_other
    end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
