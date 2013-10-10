require 'radix'
require_relative '../app/models/permalink'

describe Permalink do
  it 'generates a permalink string for the given seed and alphabet' do
    Permalink.new(1, 'a').generate.should be_instance_of String
  end

  it 'generates different permalinks for different seeds' do
    Permalink.new(1, 'a').generate.should_not == Permalink.new(2, 'a').generate
  end

  it 'generates a permalink string containing only letters from alphabet' do
    Permalink.new(42, 'ab').generate.should =~ /[ab]{1,}/
  end

  it 'generates short permalink for the web alphabet' do
    web_alphabet = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).join
    Permalink.new(10_000_000, web_alphabet).generate.length.should == 4
  end
end