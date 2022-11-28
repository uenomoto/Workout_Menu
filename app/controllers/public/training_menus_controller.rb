class Public::TrainingMenusController < ApplicationController


  def new
    @training_menu = TrainingMenu.new
  end

  def create
    @training_menu =TrainingMenu.new(training_menu_params)
    @training_menu.user_id = current_user.id
    if @training_menu.save
      redirect_to training_menu_path(@training_menu.id)
    else
      render :new
    end
  end

  def index
    @training_menus = TrainingMenu.where(user:current_user)
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
    @training_menus = TrainingMenu.where(user:current_user)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def check
  end

  def complete
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:user_id, :training_name_id, :date, :count, :set, :status, :weight)
  end

end
