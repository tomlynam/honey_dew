class ListsController < ApplicationController
	before_action :user

  def index
    @lists = List.where(user_id:@user)
  end

  def show
    @list = List.find(params[:id])
    @rejected = @list.items.where(complete: true, assigned: false)
  	@pending = @list.items.where(complete: false, assigned: false)
    @complete = @list.items.where(complete: true, assigned: true)
  	@incomplete = @list.items.where(complete: false, assigned: true)
    @item = @list.items.new
  end

  def edit
  end

  def new
  	@list = List.new
  end

  def create
    @list = @user.lists.new(list_params)
    @list.user_id = current_user.id
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
  	params.require(:list).permit(:title, :description, :user_id)
  end

  def user
    @user = current_user
  end

end
