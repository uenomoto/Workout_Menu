class Public::TrainingMenusController < ApplicationController

before_action :authenticate_user!
before_action :current_user?, only: [:edit, :destroy]

  def new
    @training_menu = TrainingMenu.new
    @training_names = current_user.training_names
    @genres = current_user.genres
  end

  def create
    # binding.pry
    @training_menu = TrainingMenu.new(training_menu_params)
    @training_menu.user_id = current_user.id
    if @training_menu.save
      redirect_to training_menu_path(@training_menu.id), flash: {success: "メニュー作成しました。"}
    else
      flash.now[:danger] = "トレ名を入力してください"
      @training_names = current_user.training_names
      @genres = current_user.genres
      render :new
    end
  end

  def index
    @training_menus = TrainingMenu.where(user:current_user)
  end

  def anywhen
    @training_menus = TrainingMenu.where(user:current_user, date: params[:id])
    @training_menu_day = (params[:id])
  end

  def show
    @menu = TrainingMenu.find(params[:id])
  end

  def edit
    @training_names = current_user.training_names
    @genres = current_user.genres
    @training_menu = TrainingMenu.find(params[:id])
      if @training_menu.completion == false
      render :edit
      else
      flash[:warning] = "完了したメニューは編集できません"
      redirect_to training_menus_path
      end
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.update(training_menu_params)
      redirect_to training_menu_path(@training_menu.id), flash: {info: "メニュー編集しました。"}
    else
      flash.now[:danger] = "編集に失敗しました"
      @training_names = current_user.training_names
      @genres = current_user.genres
      render :edit
    end
  end

  def destroy
    @training_menu = TrainingMenu.find(params[:id])
    @training_menu.destroy
    flash[:danger] = "メニュー削除しました"
    redirect_to training_menus_path
  end

  def check
    @training_menus = TrainingMenu.where(user:current_user, date: params[:id])
  end

  def complete
    @training_menu = TrainingMenu.where(user:current_user, date: params[:id])
    @training_menu.update(completion: true)
    redirect_to training_menus_path, flash: {success: "トレーニングお疲れ様でした！"}
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:user_id, :training_name_id, :genre_id, :date, :count, :set, :status, :weight, :distance, :completion)
  end

  def current_user?
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.user_id != current_user.id
      redirect_to main_path, flash: {danger: 'ご本人様ではないので編集できません。'}
    end
  end

end
