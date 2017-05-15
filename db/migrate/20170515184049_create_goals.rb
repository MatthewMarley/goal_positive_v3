class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.integer 
    end
  end
end
