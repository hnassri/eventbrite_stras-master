require 'rails_helper'

RSpec.describe "event/show", type: :view do
  describe " " do
    it "test" do 
      @user = User.create
   @event = Event.create!(title: "Mon event",description: "nbggggggggggggggggggggggggggggggggggggg", start_date: DateTime.new(2022,5,8),user: @user,price: 45, duration: 5,location: "Haguenau")

    render

    expect(rendered).to match /Mon event/

    end
  end
end
