class Public::TrainingNamesController < ApplicationController


  def new
   @training_name = TrainingName.new
  end

  def create
   @training_name = TrainingName.new(training_name_params)
   @training_name.user_id = current_user.id
   if @training_name.save
    redirect_to training_name_path(@training_name.id)
   else
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
    redirect_to training_name_path(@training_name.id)
   else
    render :edit
   end
  end


  private

  def training_name_params
    params.require(:training_name).permit(:genre_id, :user_id, :name, :introduction)
  end

end
