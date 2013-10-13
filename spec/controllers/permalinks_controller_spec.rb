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

  context "show action" do
    let(:url) { "http://test/" }
    let(:permalink) { PermalinkRepo.instance.register url }

    context 'unknown :id submitted' do
      before { get :show, id: 'unknown' + permalink.to_param }

      it 'should redirect to main page' do
        response.should redirect_to root_path
      end
    end

    context ':id is submitted with extra symbol' do
      before { get :show, id: permalink.to_param }

      it 'should render show template' do
        response.should render_template "show"
      end

      it 'should recall a permalink' do
        assigns[:permalink].url.should == url
      end
    end

    context ':id is submitted without extra symbol' do
      before { get :show, id: permalink.short }

      it 'should redirect to recalled url' do
        response.should redirect_to permalink.url
      end
    end
  end

  context "create action" do
    before { post :create, permalink: { url: 'http://test/' } }

    it 'should register provided permalink' do
      assigns[:permalink].short.should_not be_empty
    end

    it 'should redirect to show action' do
      response.should redirect_to permalink_path assigns[:permalink].to_param
    end
  end
end