class RenameStatusUpdatesToUpdates < ActiveRecord::Migration[5.0]
  def change
    rename_table :status_updates, :updates
  end
end
