class LinksController < ApplicationController
  def index
    render locals: { links: Link.all }
  end

  def show
    if Link.exists?(params[:id])
      render locals: { link: Link.find(params[:id]) }
    else
      render html: 'Link not found', status: 404
    end
  end

  def new
    render locals: { link: Link.new }
  end

  def create
    link = Link.new(link_params)
    if link.save
      redirect_to link
    else
      render :new
    end
  end

  def edit
    render locals: { link: Link.find(params[:id]) }
  end

  def update
    if Link.find(params[:id])
      link = Link.find(params[:id])
      if link.update(link_params)
        redirect_to teacher
      else
        render :edit
      end
    else
      render html: 'Link not found', status: 404
    end
  end

  def destroy
    if Link.exists?(params[:id])
      Link.destroy(params[:id])
      flash[:notice] = "Link destroyed."
      redirect_to links
    else
      flash[:alert] = "There was an error. Please try again."
    end
  end

  private
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
