
# app/controllers/api/v1/pages_controller.rb
class Api::V1::PagesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
    respond_to do |format|
      format.html
      format.json { render json: @pages }
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
  end


  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    respond_to do |format|
      if @page.save
        format.html { render json: @page }
        format.json { render json: @page, status: :created}
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.permit(:page_url)
  end
end
