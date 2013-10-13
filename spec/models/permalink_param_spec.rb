require_relative '../../app/models/permalink_param'

describe PermalinkParam do
  it 'removes extra symbol' do
    PermalinkParam.new("param#{ENV["EXTRA_SUMBOL"]}").pure.should == "param"
  end
end