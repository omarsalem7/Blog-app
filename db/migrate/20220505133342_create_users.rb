class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: 'https://image.shutterstock.com/image-vector/avatar-glyph-flat-vector-icon-600w-1471589723.jpg'
      t.string :bio
      t.integer :posts_counter, default: 0
      t.timestamps
    end
  end
end
