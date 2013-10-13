require_relative '../../app/models/browser'

describe Browser do
  let(:browser) { Browser.all.first }

  it 'known about all supported browsers' do
    Browser.all.should have_at_least(1).element
  end

  it 'should have name and abbreviation attributes' do
    browser.name.should_not be_empty
    browser.abbreviation.should_not be_empty
  end

  it 'detects browser by name' do
    Browser.by_name(browser.name).abbreviation.should == browser.abbreviation
  end
end