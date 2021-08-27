class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.text :profile
      t.string :profile_image_id

      t.timestamps
    end
  end
end
