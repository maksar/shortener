require_relative '../spec_helper'

describe PermalinkCode do
  it 'generates a permalink string for the given seed and alphabet' do
    PermalinkCode.new(1, 'a').generate.should be_instance_of String
  end

  it 'generates different permalinks for different seeds' do
    PermalinkCode.new(1, 'a').generate.should_not == PermalinkCode.new(2, 'a').generate
  end

  it 'generates a permalink string containing only letters from alphabet' do
    PermalinkCode.new(42, 'ab').generate.should =~ /[ab]{1,}/
  end

  it 'generates short permalink for the web alphabet' do
    PermalinkCode.new(10_000_000, ENV["ALPHABET"]).generate.length.should == 4
  end
end