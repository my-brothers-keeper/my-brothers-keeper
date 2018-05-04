class AddLocationToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :location, :st_point, srid: 4326
  end
end
