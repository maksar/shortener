class PermalinksController < ApplicationController

  def index
    @permalink = Permalink.new
  end

  def show
    unless details_request?
      return redirect_to PermalinkRepo.instance.count(params[:id]).url
    end

    @permalink = PermalinkRepo.instance.recall params[:id].gsub(/#{Regexp.quote(ENV["EXTRA_SUMBOL"])}$/, '')
  end

  def create
    @permalink = PermalinkRepo.instance.register permalinks_param[:url]
    redirect_to permalink_path @permalink
  end

  private

  def permalinks_param
    params.require(:permalink).permit(:url)
  end

  def details_request?
    params[:id].ends_with?(ENV["EXTRA_SUMBOL"])
  end
end
