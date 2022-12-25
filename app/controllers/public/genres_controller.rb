class Public::GenresController < ApplicationController

before_action :authenticate_user!

  def index
    @genres = Genre.where(user:current_user)
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id
    if @genre.save
      redirect_to genres_path, flash: {success: "部位登録しました。"}
    else
      @genres = Genre.where(user:current_user)
      flash.now[:danger] = "部位登録に失敗しました。"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path, flash: {info: "部位編集しました。"}
    else
      flash.now[:danger] = "部位編集に失敗しました。"
      render :edit
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name, :user_id)
  end

end
