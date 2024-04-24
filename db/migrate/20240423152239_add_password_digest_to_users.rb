class AddPasswordDigestToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :password_digest, :string
    # Remove the old password column
    remove_column :users, :password
  end

  def down
    # Add the password column back
    add_column :users, :password, :string
    # Remove the password_digest column
    remove_column :users, :password_digest
  end
end
