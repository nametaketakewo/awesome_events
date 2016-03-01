class UsersController < ApplicationController
  def retire
  end

  def destroy
    if current_user.destroy
      reset_session
      redirect_to root_path, notice: '退会が完了しました'
    else
      render :retire
    end
  end
end
