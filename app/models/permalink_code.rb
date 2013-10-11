class PermalinkCode
  def initialize seed, alphabet_string = ENV["ALPHABET"]
    @seed = seed
    @alphabet = alphabet_string.split('')
  end

  def generate
    if @alphabet.length == 1
      @alphabet.first * @seed
    else
      @seed.b(@alphabet.length).to_s(@alphabet)
    end
  end
end