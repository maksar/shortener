class PermalinkRepo
  include Singleton

  def initialize
    uri = URI.parse ENV["REDIS_URL"]
    @redis = Redis.new host: uri.host, port: uri.port, password: uri.password
  end

  def recall short
    url, count = @redis.hmget short, :url, :count

    return EmptyPermalink.new unless url
    Permalink.new url: url, count: count.to_i, short: short
  end

  def register url
    short = PermalinkCode.new(seed).generate
    @redis.hmset short, :url, url

    recall short
  end

  def count short
    @redis.hincrby short, :count, 1

    recall short
  end

  private

  def seed
    @redis.incr :seed
  end
end