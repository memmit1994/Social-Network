class CreateUserPhones < ActiveRecord::Migration[5.0]
    def change
        create_table :user_phones do |t|
            t.integer :user_id
            t.string :phone_number

            t.timestamps
        end
    end
end
