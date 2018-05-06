class AddEnabledToNeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :needs, :enabled, :bool, null: false, default: true
  end
end
