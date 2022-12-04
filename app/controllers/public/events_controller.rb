class Public::EventsController < ApplicationController

  def create
    #binding.pry
    @event = Event.new(event_params)
    @event.save
    redirect_to new_training_menu_path
  end

  private

  def event_params
    params.require(:event).permit(:start_time)
  end
end
