class RemoveLocationsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :locations, :string
  end
end
