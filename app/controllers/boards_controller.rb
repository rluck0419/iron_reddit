class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    boards = Board.all.page params[:page]
    render locals: { boards: boards }
  end

  def show
    if Board.exists?(params[:id])
      board = Board.find(params[:id])
      links = board.links.group(:id).order("SUM(upvotes_count - downvotes_count) DESC")
      render locals: { board: board, links: links }
    else
      render html: 'Board not found', status: 404
    end
  end

  def new
    render locals: { downvote: Board.new }
  end

  def create
    board = Board.new(board_params)
    if board.save
      redirect_to board
    else
      render :new, locals: {
        board: board
      }
    end
  end

  def edit
    render locals: { board: Board.find(params[:id]) }
  end

  def update
    if Board.find(params[:id])
      board = Board.find(params[:id])
      if board.update(board_params)
        redirect_to board
      else
        render :edit
      end
    else
      render html: 'Board not found', status: 404
    end
  end

  def destroy
    if Board.exists?(params[:id])
      Board.destroy(params[:id])
      flash[:notice] = "Board destroyed (and their links and those links' votes)."
      redirect_to boards
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end

  private
  def board_params
    params.require(:board).permit(:name)
  end
end
