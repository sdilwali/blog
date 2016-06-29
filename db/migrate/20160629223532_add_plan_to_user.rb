class AddPlanToUser < ActiveRecord::Migration
  def change
    add_column :users, :plan_ID, :integer
  end
end
