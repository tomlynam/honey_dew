class ListsController < ApplicationController
	before_action :list, except: [ :new, :show, :create]

  def index
  	@lists = current_user.lists
  end

  def show
  	@list = List.find(params[:id])
  	# @complete = @list.items.where(complete: true)
  	# @incomplete = @list.items - @complete
  end

  def edit
  end

  def new
  	@list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
  	if @list.save
      redirect_to lists_path
  	else 
  		render :new
  	end
  end

  def update
  	if @list.update(list_params)
  		redirect_to list_path(@list)
  	else
  		render :edit
  	end
  end

  def destroy
  	@list.destroy
  		redirect_to lists_path
  end

  private

  def list_params
  	params.require(:list).permit(:title, :description)
  end

  def list
  	@list = current_user.lists.find(params[:id])
  end

end
