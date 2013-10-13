class PermalinkRepo
  include Singleton

  def initialize
    uri = URI.parse ENV["REDIS_URL"]
    @redis = Redis.new host: uri.host, port: uri.port, password: uri.password
  end

  def recall short
    result = @redis.hgetall short

    return EmptyPermalink.new if result.empty?

    Permalink.new result.merge short: short
  end

  def register url
    short = PermalinkCode.new(seed).generate
    @redis.hmset short, :url, url

    recall short
  end

  def count short, browser
    @redis.hincrby short, browser, 1

    recall short
  end

  private

  def seed
    @redis.incr :seed
  end
end