class Page < ApplicationRecord
  before_create :index_content

  require 'nokogiri'
  require 'open-uri'

  def index_content

    doc = Nokogiri::HTML(open(self.page_url))
    page_obj = self
    tag_content1 = []
    tag_content2 = []
    tag_content3 = []
    header_attribs = {}
    doc.css('a').each do |link|
      page_obj.urls << link.attributes["href"].value
    end

    doc.css('h1').each do |tag|
      tag_content1.push(tag.content)
    end

    doc.css('h2').each do |tag|
      tag_content2.push(tag.content)
    end

    doc.css('h3').each do |tag|
      tag_content3.push(tag.content)
    end
    header_attribs_h1 = {
               header_tag: "h1",
               content: tag_content1
    }
    header_attribs_h2 = {
               header_tag: "h2",
               content: tag_content2
    }
    header_attribs_h3 = {
                header_tag: "h3",
                content: tag_content3
    }
    page_obj.headers << header_attribs_h1 
    page_obj.headers << header_attribs_h2
    page_obj.headers << header_attribs_h3
    page_obj.headers
  end
end
