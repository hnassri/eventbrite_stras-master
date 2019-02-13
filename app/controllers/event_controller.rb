class EventController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :authenticate_admin, only: [:edit, :destroy]

  def index

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:title],user_id: current_user.id,duration: params[:duration],description: params[:body],price: params[:price],location: params[:location],start_date: params[:start_date])
    if @event.save
      redirect_to event_path(@event.id)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(title: params[:title],user_id: current_user.id,duration: params[:duration],description: params[:body],price: params[:price],location: params[:location],start_date: params[:start_date])
      redirect_to event_path(@event.id)
    end
  end 
  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @destro = Event.find(params[:id])
    @destro.destroy


    redirect_to event_index_path
  end

  def authenticate_admin
    current_user  == Event.find(params[:id]).user ? true : false
  end

end