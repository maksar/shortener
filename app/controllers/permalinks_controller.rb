class PermalinksController < ApplicationController
  def index
    @permalink = Permalink.new
  end

  def show
    @permalink = Permalink.new
  end

  def create
    redirect_to permalink_path Permalink.for_url(permalinks_param[:url])
  end

  def permalinks_param
    params.require(:permalink).permit(:url)
  end
end
