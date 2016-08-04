class AddUserIdColumnToCat < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :string
    add_index :cats, :user_id
  end
end
