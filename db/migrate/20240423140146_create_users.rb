class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email_id
      t.string :auth_token
      t.string :refresh_auth_token
      t.string :valid_till

      t.timestamps
    end
  end
end
