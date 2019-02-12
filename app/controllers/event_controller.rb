class EventController < ApplicationController
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

  def show
    @event = Event.find(params[:id])
  end
end
