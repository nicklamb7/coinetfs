class ChangeUserOnEtfs < ActiveRecord::Migration[6.0]
  def change
    change_column_null :etfs, :user_id, true
  end
end
