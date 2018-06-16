class UsersController < ApplicationController

  def show

  end

  def edit
   if current_user != @user
        redirect_to root_path
      end
  end

end
