class AddDefaultValueToConfirmed < ActiveRecord::Migration[5.0]
  def change
    change_column :friendships, :confirmed, :boolean, :default => false
  end
end
