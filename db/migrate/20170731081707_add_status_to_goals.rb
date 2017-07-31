class AddStatusToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :status, :string
  end
end
