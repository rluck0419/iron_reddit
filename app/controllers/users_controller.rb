class UsersController < ApplicationController
  def index
    render locals: { users: User.all }
  end

  def show
    if User.exists?(params[:id])
      render locals: { user: User.find(params[:id]) }
    else
      render html: 'User not found', status: 404
    end
  end

  def new
    render locals: { user: User.new }
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user
    else
      render :new
    end
  end

  def edit
    render locals: { user: User.find(params[:id]) }
  end

  def update
    if User.find(params[:id])
      user = User.find(params[:id])
      if user.update(user_params)
        redirect_to user
      else
        render :edit
      end
    else
      render html: 'User not found', status: 404
    end
  end

  def destroy
    if User.exists?(params[:id])
      User.destroy(params[:id])
      flash[:notice] = "User destroyed."
      redirect_to user
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
