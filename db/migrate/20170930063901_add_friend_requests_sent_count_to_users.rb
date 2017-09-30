class AddFriendRequestsSentCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :friend_requests_sents_count, :integer
  end
end
