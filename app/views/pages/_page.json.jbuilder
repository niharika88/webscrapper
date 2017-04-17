json.extract! page, :id, :content, :page_url, :created_at, :updated_at
json.url page_url(page, format: :json)
