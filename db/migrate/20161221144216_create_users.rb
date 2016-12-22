class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :nickname
      t.integer :gender
      t.date :birthdate
      t.string :hometown
      t.integer :marital_status
      t.text :bio

      t.timestamps
    end
  end
end
