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
    registered_permalink.short.should_not be_empty
    Browser.all.each do |browser|
      registered_permalink.send(browser.abbreviation).should be_zero
    end
  end

  it 'should not register empty URLs' do
    subject.register('').errors.should_not be_empty
  end

  it 'should recall permalink by short version' do
    subject.recall(registered_permalink.short).url.should == registered_permalink.url
  end

  it 'should return nothing is permalink wans not found' do
    subject.recall(registered_permalink.short + 'bad').should be_nil
  end

  it 'should fill rest of permalink attributes after recalling' do
    subject.recall(registered_permalink.short).short.should_not be_empty
    Browser.all.each do |browser|
      subject.recall(registered_permalink.short).send(browser.abbreviation).should be_zero
    end
  end

  it 'should allow registering using custom available hashes' do
    subject.recall(subject.register(url, registered_permalink.short + 'more').short).url.should == url
  end

  it 'should not allow registering using custom occupied hashes' do
    subject.register(url, registered_permalink.short).errors.should_not be_empty
  end

  it 'should count usages of the permalink' do
    subject.count(registered_permalink.short, :other).other.should == subject.count(registered_permalink.short, :other).other - 1
  end
end
