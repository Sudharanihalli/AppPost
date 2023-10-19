class AppPostsController < ApplicationController
    def index
        @app_posts = AppPost.all
    end  
    
    def show
        @app_post = AppPost.find(params[:id])
        rescue ActiveRecords::RecordNotFound
        redirect_to root_path
    end

    def new
        @app_post = AppPost.new
    end
end