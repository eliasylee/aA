class ChangeDefaultColumns < ActiveRecord::Migration
  def change
    change_column_default :albums, :live, default: nil
    change_column_default :tracks, :bonus, default: nil
  end
end
