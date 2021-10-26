class AddUserToEtfs < ActiveRecord::Migration[6.0]
  def change
    add_reference :etfs, :user, null: true, foreign_key: true
  end
end
