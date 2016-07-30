class UpvotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    render locals: { upvotes: Upvote.all }
  end

  def show
    if Upvote.exists?(params[:id])
      render locals: { upvote: Upvote.find(params[:id]) }
    else
      render html: 'Upvote not found', status: 404
    end
  end

  def new
    render locals: { upvote: Upvote.new }
  end

  def create
    if params[:upvote][:user_id].nil?
      flash[:alert] = "You must be logged in to do that."
      redirect_back(fallback_location: root_path)
    else
      upvote = Upvote.new(upvote_params)
      if upvote.save
      else
        render :new
      end
    end
  end

  def edit
    render locals: { upvote: Upvote.find(params[:id]) }
  end

  def update
    if Upvote.find(params[:id])
      upvote = Upvote.find(params[:id])
      if upvote.update(upvote_params)
        redirect_to upvote
      else
        render :edit
      end
    else
      render html: 'Upvote not found', status: 404
    end
  end

  def destroy
    if Upvote.exists?(params[:id])
      Upvote.destroy(params[:id])
      flash[:notice] = "Upvote destroyed."
      redirect_to upvotes
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end

  private
  def upvote_params
    params.require(:upvote).permit(:link_id, :user_id)
  end
end
