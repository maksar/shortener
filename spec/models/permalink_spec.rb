require_relative '../spec_helper'

describe Permalink do
  it { should have_attribute(:count).of_type(Integer).with_default_value_of(0) }
  it { should have_attribute(:url) }
  it { should have_attribute(:short) }

  it 'uses short version and a plus sumbol as param' do
    permalink = Permalink.new short: 'short'
    permalink.to_param.should == permalink.short + ENV["EXTRA_SUMBOL"]
  end
end