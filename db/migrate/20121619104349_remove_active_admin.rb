class RemoveActiveAdmin < ActiveRecord::Migration
  def up
    remove_index(:active_admin_comments, :name => "index_active_admin_comments_on_author_type_and_author_id")
    remove_index(:active_admin_comments, :name => "index_active_admin_comments_on_namespace")
    remove_index(:active_admin_comments, :name => "index_admin_notes_on_resource_type_and_resource_id")
    remove_index(:admin_users, :name => "index_admin_users_on_email")
    remove_index(:admin_users, :name => "index_admin_users_on_reset_password_token")

    drop_table :active_admin_comments
    drop_table :admin_users
  end

  def down
  end
end
