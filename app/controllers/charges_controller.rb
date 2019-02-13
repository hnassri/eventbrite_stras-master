class ChargesController < ApplicationController

  def new
    @amount = Event.find(params[:event_id]).price
    @event = Event.find(params[:event_id]) 
  end
  
  def create
    # Amount in cents
    @amount = Event.find(params[:event_id]).price 
  
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount * 100,
      :description => 'Rails Stripe customer',
      :currency    => 'eur'
    )
    attendance = Attendance.new(stripe_customer_id: customer.id, event_id: params[:event_id], user_id: current_user.id)
    if attendance.save
      redirect_to event_path(params[:event_id])
    end
  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_event_charge_path(params[:event_id])
   end

end
