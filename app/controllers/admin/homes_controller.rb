class Admin::HomesController < ApplicationController

 def top
  @users = User.all.order(created_at: :desc)
 end

end
