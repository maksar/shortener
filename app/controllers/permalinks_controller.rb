class PermalinksController < ApplicationController

  def index
    @permalink = Permalink.new
  end

  def show
    unless details_request?
      @permalink = PermalinkRepo.instance.count(params[:id], BrowserDetector.new(request.user_agent).browser)
      return redirect_to(root_path, flash: { error: I18n.t("permalink.not_found") }) unless @permalink

      return redirect_to @permalink.url
    end

    @permalink = PermalinkRepo.instance.recall PermalinkParam.new(params[:id]).pure
    return redirect_to(root_path, flash: { error: I18n.t("permalink.not_found") }) unless @permalink
  end

  def create
    @permalink = PermalinkRepo.instance.register permalinks_param[:url], permalinks_param[:short]
    return render action: :index if @permalink.errors.present?

    redirect_to permalink_path @permalink
  end

  private

  def permalinks_param
    params.require(:permalink).permit(:url, :short)
  end

  def details_request?
    params[:id].ends_with?(ENV["EXTRA_SUMBOL"])
  end
end
