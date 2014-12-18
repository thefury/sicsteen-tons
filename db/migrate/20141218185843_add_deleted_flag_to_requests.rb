class AddDeletedFlagToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :deleted, :boolean, null: false, default: false
    add_index :requests, :deleted
  end
end
