class CreateFriendRequestsSents < ActiveRecord::Migration
  def change
    create_table :friend_requests_sents do |t|
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps

    end
  end
end
