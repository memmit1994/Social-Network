class RemoveHometownFromUser < ActiveRecord::Migration[5.0]
    def change
        remove_column :users, :hometown
    end
end
