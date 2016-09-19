class AddBonusToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :bonus, :boolean, null: false, default: false
  end
end
