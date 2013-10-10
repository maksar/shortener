require_relative '../spec_helper'

describe Permalink do
  it 'should accept and expose url attribute' do
    permalink = Permalink.new url: 'test'
    permalink.url.should == 'test'
  end

  it 'should generate short version of the url' do
    permalink = Permalink.new url: 'test'
    permalink.short.should_not be_empty
  end

  it 'should generate short version version consistently' do
    Permalink.new(url: 'test').short.should == Permalink.new(url: 'test').short
  end

  it 'uses short version as param' do
    permalink = Permalink.new url: 'test'
    permalink.short.should == permalink.to_param
  end
end