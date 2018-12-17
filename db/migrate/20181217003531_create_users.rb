class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login_id
      t.string :pssword_digest

      t.timestamps
    end
  end
end
