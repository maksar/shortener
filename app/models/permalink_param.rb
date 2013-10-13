class PermalinkParam
  def initialize param
    @param = param
  end

  def pure
    @param.gsub(/#{Regexp.quote(ENV["EXTRA_SUMBOL"])}$/, '')
  end
end