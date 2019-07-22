class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.text :email
      t.string :company

      t.timestamps
    end
  end
end
