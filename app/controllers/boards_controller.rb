class BoardsController < ApplicationController
  def index
    render locals: { boards: Board.all }
  end

  def show
    if Board.exists?(params[:id])
      render locals: { board: Board.find(params[:id]) }
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
      render :new
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
