class CreateNeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :needs do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :item, null: false
      t.string :comment

      t.timestamps
    end
  end
end
