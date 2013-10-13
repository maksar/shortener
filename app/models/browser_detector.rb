class BrowserDetector
  def initialize user_agent
    @user_agent = user_agent
  end

  def browser
    Browser.by_name(UserAgent.parse(@user_agent).browser).try(:abbreviation) || :other
  end
end