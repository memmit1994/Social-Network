class AddLikersCountToComment < ActiveRecord::Migration[5.0]
    def change
        add_column :comments, :likers_count, :integer, :default => 0
    end
end
