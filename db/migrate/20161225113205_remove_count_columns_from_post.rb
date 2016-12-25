class RemoveCountColumnsFromPost < ActiveRecord::Migration[5.0]
    def change
        remove_column :posts, :comments_count
        remove_column :posts, :likes_count
    end
end
