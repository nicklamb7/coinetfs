class CreateEtfs < ActiveRecord::Migration[6.0]
  def change
    create_table :etfs do |t|
      t.string :name
      t.text :description
      t.references :asset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
