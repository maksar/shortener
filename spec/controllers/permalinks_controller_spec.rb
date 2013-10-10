require_relative '../spec_helper'

describe PermalinksController do
  context "index action" do
    before { get :index }

    it 'should render index template' do
      response.should render_template "index"
    end

    it 'should create a new empty permalink' do
      assigns[:permalink].url.should be_nil
    end
  end

  context "create action" do
    it 'should redirect to show action' do
      post :create, permalink: { url: 'test' }
      response.should redirect_to permalink_path Permalink.for_url('test')
    end
  end
end