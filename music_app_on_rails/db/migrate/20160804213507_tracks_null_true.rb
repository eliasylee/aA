class TracksNullTrue < ActiveRecord::Migration
  def change
    change_column :tracks, :bonus, :boolean, null: true, default: false
  end
end
