class AddDetailsToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :city, :string
    add_column :organizations, :state, :string
    add_column :organizations, :zip_code, :string
    add_column :organizations, :contact_phone, :string
    add_column :organizations, :contact_email, :string
    add_column :organizations, :website, :string
  end
end
