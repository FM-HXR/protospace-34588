class AddUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :user_id, :bigint, null: false
  end
end
