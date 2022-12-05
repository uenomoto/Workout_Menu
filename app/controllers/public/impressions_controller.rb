class Public::ImpressionsController < ApplicationController


  def new
    @impression = Impression.new
  end

  def create
    #binding.pry
    @impression = Impression.new(impression_params)
    @impression.user_id = current_user.id
    if @impression.save
    redirect_to impression_path(@impression.id)
    else
    render :new
    end
  end


  def index
  end

  def show
  end


  private

  def impression_params
    params.require(:impression).permit(:user_id, :text)
  end

end
