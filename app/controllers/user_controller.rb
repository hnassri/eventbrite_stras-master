class UserController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def show
    @user  = User.find(params[:id])
    @event = Event.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

end
