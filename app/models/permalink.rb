class Permalink
  attr_accessor :url
  include ActiveModel::Model

  def self.for_url url
    Permalink.new url: url
  end

  def short
    # TODO to a.shestakov Using url.hash as seed value for now. Needs to be substituted with real seed.
    PermalinkCode.new(url.hash).generate
  end

  def to_param
    short
  end
end