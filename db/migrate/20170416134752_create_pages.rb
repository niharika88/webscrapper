class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :page_url
      t.string :urls, array: true, default: []
      t.json   :headers, array:true, default: []
      t.timestamps
    end
  end
end
