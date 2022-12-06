class Public::ImpressionsController < ApplicationController


  def new
    # 空のimpressionインスタンスを生成
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
    @impressions = Impression.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def impression_params
    params.require(:impression).permit(:user_id, :text)
  end

end
