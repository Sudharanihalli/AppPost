class MoveBodyToActionText < ActiveRecord::Migration[7.1]
  def change
    AppPost.all.find_each do |app_post|
      app_post.update(content: app_post.body)
  end

  remove_column :app_posts, :body
end
end
