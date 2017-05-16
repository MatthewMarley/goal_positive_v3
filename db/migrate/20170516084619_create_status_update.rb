class CreateStatusUpdate < ActiveRecord::Migration[5.0]
  def change
    create_table :status_updates do |t|
      t.integer :user_id
      t.integer :goal_id
      t.datetime :date
      t.string :title
      t.string :update_description
      t.timestamps
    end
  end
end
