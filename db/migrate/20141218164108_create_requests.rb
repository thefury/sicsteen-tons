class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :floor

      t.timestamps
    end
  end
end
