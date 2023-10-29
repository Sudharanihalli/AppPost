class AddPublishedAtToAppPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :app_posts, :published_at, :datetime
  end
end
