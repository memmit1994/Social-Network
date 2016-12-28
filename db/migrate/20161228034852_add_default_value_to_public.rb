class AddDefaultValueToPublic < ActiveRecord::Migration[5.0]
    def change
        change_column :posts, :public, :boolean, :default => false
    end
end
