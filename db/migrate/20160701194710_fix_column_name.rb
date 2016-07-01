class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :plan_ID, :plan_id
  end
end
