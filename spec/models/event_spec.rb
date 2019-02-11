require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do 
    @user = User.create
    @event = Event.create(start_date: DateTime.new(2033,5,5), duration: 65, title: 'mon title', description: 'ceci est ma description, elle est vraiment géniale', price: 2, location: 'Riedseltz', user: @user)
  end
    
    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end
    
    describe "#title" do
      it "should not be lower that 5 characters" do
        invalid_event = Event.create(start_date: DateTime.new(2033,5,5), duration: 65, title: 'yo', description: 'ceci est ma description, elle est vraiment géniale', price: 2, location: 'Riedseltz', user: @user)
        expect(invalid_event).not_to be_valid
        expect(invalid_event.errors.include?(:title)).to eq(true)
      end
    end

    # context "associations" do

    #   describe "users" do
    #     it "should have_many events " do
    #       event = Event.create(user: @user)
    #       expect(@user.events.include?(event)).to eq(true)
    #     end
    #   end
    # end

    context "public instance methods" do

      describe "duration should return true" do

        it "should return a multiple of 5" do
          expect(@event.is_multiple_of_5?).to eq(true)
        end

      end
    end
end
