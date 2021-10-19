class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :link
      t.date :date
      t.string :source
      t.references :asset, null: false, foreign_key: true
      t.references :etf, null: false, foreign_key: true

      t.timestamps
    end
  end
end
