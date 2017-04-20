require "rails_helper"

RSpec.describe Page do

  describe "Attributes Check" do
    it { is_expected.to have_attribute :page_url }
  end

  describe "Indexing content callback" do
    it "expects to index content before save" do
      subject = Page.new(page_url: 'http://www.nooooooooooooooo.com/')
      subject.save
      expect(subject.reload.urls).not_to be_nil
      expect(subject.reload.headers).not_to be_nil
    end
  end
end
