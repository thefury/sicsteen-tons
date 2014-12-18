class ConvertFloorToString < ActiveRecord::Migration
  def up
    change_column :requests, :floor, :text
  end

  def down
    change_column :requests, :floor, :integer
  end
end
