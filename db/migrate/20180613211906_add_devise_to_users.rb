# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
    end

    # Devise uses a different column name than has_secure_password
    rename_column :users, :password_digest, :encrypted_password

    add_index :users, :username,             unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
