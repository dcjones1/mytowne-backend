class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birth_date
      t.string :email
      t.string :username
      t.string :town
      t.string :avatar
      t.text :bio
      t.timestamps
    end
  end
end
