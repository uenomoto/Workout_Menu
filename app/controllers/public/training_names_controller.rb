class Public::TrainingNamesController < ApplicationController


  def new
   @training_name = TrainingName.new
  end

  def create
   @training_name = TrainingName.new(training_name_params)
   @training_name.user_id = current_user.id
   if @training_name.save
    redirect_to training_name_path(@training_name.id), flash: {success: "名前作成しました。"}
   else
    flash.now[:danger] = "失敗しました"
    render :new
   end
  end

  def index
   @training_names = TrainingName.where(user:current_user)
  end

  def show
   @training_name = TrainingName.find(params[:id])
  end

  def edit
   @training_name = TrainingName.find(params[:id])
  end

  def update
   @training_name = TrainingName.find(params[:id])
   if @training_name.update(training_name_params)
    redirect_to training_name_path(@training_name.id), flash: {info: "名前編集しました。"}
   else
    flash.now[:danger] = "編集失敗しました"
    render :edit
   end
  end


  private

  def training_name_params
    params.require(:training_name).permit(:genre_id, :user_id, :name, :introduction)
  end

end
