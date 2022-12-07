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
    @impressions = Impression.order(created_at: :desc).page(params[:page]).per(4)
  end

  def show
    @impression = Impression.find(params[:id])
    @post_comment = PostComment.new
    # includes(:user)これはネストしたN＋１問題を解決してくれる
    @post_comments = @impression.post_comments.includes(:user)
  end

  def edit
    @impression = Impression.find(params[:id])
    if @impression.user_id == current_user.id
      render :edit
    else
      redirect_to impressions_path
    end
  end

  def update
    @impression = Impression.find(params[:id])
    if @impression.update(impression_params)
    redirect_to impression_path(@impression), notice: "つぶやき編集しました"
    else
      render :edit
    end
  end

  def destroy
    @impression = Impression.find(params[:id])
    @impression.destroy
    flash[:danger] = "つぶやきを削除しました"
    redirect_back(fallback_location: root_path)
  end


  private

  def impression_params
    params.require(:impression).permit(:user_id, :text)
  end

end
