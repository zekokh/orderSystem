class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :password
      t.belongs_to :role, index: true
      t.boolean :is_a_live, default: true

      t.timestamps
    end
  end
end
