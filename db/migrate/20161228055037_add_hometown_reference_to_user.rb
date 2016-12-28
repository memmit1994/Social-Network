class AddHometownReferenceToUser < ActiveRecord::Migration[5.0]
    def change
        add_reference :users, :hometown, foreign_key: true
    end
end
