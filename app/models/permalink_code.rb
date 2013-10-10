class PermalinkCode
  def initialize seed, alphabet_string = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).join
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