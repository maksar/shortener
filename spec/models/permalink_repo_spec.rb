require_relative '../spec_helper'

describe PermalinkRepo do
  subject { PermalinkRepo.instance }

  let(:url) { "http://test/" }
  let(:permalink) { Permalink.new url: url }
  let(:registered_permalink) { subject.register url }

  it 'should generate different shorts' do
    registered_permalink.short.should_not == subject.register(url).short
  end

  it 'should fill rest of permalink attributes after registering' do
    registered_permalink.count.should be_zero
    registered_permalink.short.should_not be_empty
  end

  it 'should recall permalink by short version' do
    subject.recall(registered_permalink.short).url.should == registered_permalink.url
  end

  it 'should return nothing is permalink wans not found' do
    subject.recall(registered_permalink.short + 'bad').should be_instance_of EmptyPermalink
  end

  it 'should fill rest of permalink attributes after recalling' do
    subject.recall(registered_permalink.short).count.should be_zero
    subject.recall(registered_permalink.short).short.should_not be_empty
  end

  it 'should count usages of the permalink' do
    subject.count(registered_permalink.short).count.should == subject.count(registered_permalink.short).count - 1
  end
end
