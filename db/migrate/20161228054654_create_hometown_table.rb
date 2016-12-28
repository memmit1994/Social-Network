class CreateHometownTable < ActiveRecord::Migration[5.0]
    def change
        create_table :hometowns do |t|
            t.string :city
            t.string :country
        end
    end
end
