class PermalinkRepo
  include Singleton

  def initialize
    uri = URI.parse ENV["REDIS_URL"]
    @redis = Redis.new host: uri.host, port: uri.port, password: uri.password
  end

  def recall short
    result = @redis.hgetall short

    return nil if result.empty?

    Permalink.new result.merge short: short
  end

  def register url, short = ''
    permalink = Permalink.new(url: url, short: short)

    return invalid_url(permalink) if url.empty?

    # Trying to register with custom short.
    if short.present?
      return hash_already_used(permalink) unless insert(short, url)
    else
      # Trying to insert until successful.
      short = generate_next_short until insert(short, url)
    end
    recall short
  end

  def count short, browser
    @redis.hincrby short, browser, 1 if recall short

    recall short
  end

  private

  def invalid_url permalink
    permalink.tap { |p| p.errors.add(:url, :blank) }
  end

  def hash_already_used permalink
    permalink.tap { |p| p.errors.add(:short, :used) }
  end

  def insert short, url
    @redis.hsetnx short, :url, url
  end

  def generate_next_short
    PermalinkCode.new(seed).generate
  end

  def seed
    @redis.incr :seed
  end
end