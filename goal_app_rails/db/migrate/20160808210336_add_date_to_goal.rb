class AddDateToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :deadline, :date
    add_column :goals, :private, :boolean, default: false
  end
end
