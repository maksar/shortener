class Permalink
  include ActiveAttr::Model

  attribute :url
  attribute :short
  attribute :count, type: Integer, default: 0

  def to_param
    short + ENV["EXTRA_SUMBOL"]
  end
end