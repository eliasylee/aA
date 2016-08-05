class ChangeColumnDefaults < ActiveRecord::Migration
  def change
    change_column :albums, :live, :boolean, default: nil
    change_column :tracks, :bonus, :boolean, default: nil
  end
end
