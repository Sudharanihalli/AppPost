json.extract! @app_post, :title, :content, :published_at
json.cover_image_url @app_post.cover_image_url if @app_post.cover_image.present?
