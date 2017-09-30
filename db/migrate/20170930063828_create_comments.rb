class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body_comment
      t.integer :photo_id

      t.timestamps

    end
  end
end
