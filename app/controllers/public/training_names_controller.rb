class Public::TrainingNamesController < ApplicationController


  def new
   @training_name = TrainingName.new
  end

  def create
   @training_name = TrainingName.new(training_name_params)
   @training_name.user_id = current_user.id
   if @training_name.save
    redirect_to training_names_path
   else
    render :new
   end
  end

  def index
  end

  def show
  end

  def edit
  end


  private

  def training_name_params
    params.require(:training_name).permit(:genre_id, :user_id, :name, :introduction)
  end

end
