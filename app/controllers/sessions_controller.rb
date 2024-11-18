class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end

  def index
  end

  def login
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :index, status: :unprocessable_entity
    end
  end
end
