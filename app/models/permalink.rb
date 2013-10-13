class Permalink
  include ActiveAttr::Model

  attribute :url
  attribute :short

  Browser.all.each do |browser|
    attribute browser.abbreviation, type: Integer, default: 0
  end
  attribute :other, type: Integer, default: 0

  def to_param
    short + ENV["EXTRA_SUMBOL"]
  end
end