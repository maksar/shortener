require_relative '../spec_helper'

describe BrowserDetector do
  let(:browser) { Browser.all.first }

  it 'detects supported browser' do
    BrowserDetector.new(browser.name).browser.should == browser.abbreviation
  end

  it 'detects unsupported browser' do
    BrowserDetector.new(browser.name + "bad").browser.should == :other
  end
end
