class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name_photo
      t.text :caption_photo
      t.string :image
      t.integer :poster_id

      t.timestamps

    end
  end
end
