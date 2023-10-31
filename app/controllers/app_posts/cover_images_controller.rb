class AppPosts::CoverImagesController < ApplicationController
    include ActionView::RecordIdentifier
    
 before_action :authenticate_user!
 before_action :set_app_post

 def destroy
    @app_post.cover_image.purge_later

    respond_to do |format|
    format.html { redirect_to edit_app_post_path(@app_post) }
    format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@app_post, :cover_image)) }
 end
end

#  private

 def set_app_post
    @app_post = AppPost.find(params[:app_post_id])
 end
end