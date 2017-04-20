# require 'support/factory_girl'
require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::PagesController, "creating a new indexed page" do

  it "should redirect to index with a notice on successful save" do
    expected_response_urls = ["https://play.google.com/store/apps/details?id=com.unmarketing.com", "https://twitter.com/share", "http://www.jonbishop.com", "http://www.Un-Marketing.com/blog/"]
    post 'create', { params: { page_url: 'http://www.nooooooooooooooo.com/'}}
    expect(JSON.parse(response.body)["urls"]).to eq(expected_response_urls)
  end

  it "should re-render new template on failed save" do
  	request.env["HTTP_ACCEPT"] = 'application/json'
    page = FactoryGirl.create(:page) 
    get 'index'
    expect(JSON.parse(response.body)[0]["id"]).not_to be_nil
  end

  it "should check param values" do
     post 'create', { params: { page_url: 'http://www.nooooooooooooooo.com/'}}
     assigns[:page_url].should == nil
  end

end
