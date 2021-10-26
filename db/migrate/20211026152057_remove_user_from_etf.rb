class RemoveUserFromEtf < ActiveRecord::Migration[6.0]
  def change
    remove_column :etfs, :user_id, :bigint
  end
end
