class DownvotesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    render locals: { downvotes: Downvote.all }
  end

  def show
    if Downvote.exists?(params[:id])
      render locals: { downvote: Downvote.find(params[:id]) }
    else
      render html: 'Downvote not found', status: 404
    end
  end

  def new
    render locals: { downvote: Downvote.new }
  end

  def create
    if params[:downvote][:user_id].nil?
      flash[:alert] = "You must be logged in to do that."
      redirect_back(fallback_location: root_path)
    else
      downvote = Downvote.new(downvote_params)
      if downvote.save
        respond_to do |format|
          format.json do
            
          end
          format.html do
            redirect_back(fallback_location: root_path)
          end
        end
      else
        render :new
      end
    end
  end

  def edit
    render locals: { downvote: Downvote.find(params[:id]) }
  end

  def update
    if Downvote.find(params[:id])
      downvote = Downvote.find(params[:id])
      if downvote.update(downvote_params)
        redirect_to downvote
      else
        render :edit
      end
    else
      render html: 'Downvote not found', status: 404
    end
  end

  def destroy
    if Downvote.exists?(params[:id])
      Downvote.destroy(params[:id])
      flash[:notice] = "Downvote destroyed."
      redirect_to downvotes
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end

  private
  def downvote_params
    params.require(:downvote).permit(:link_id, :user_id)
  end
end
