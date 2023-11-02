class AppPostsController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
    before_action :set_app_post, except: [:index, :new, :create]

    def index
        @app_posts = user_signed_in? ? AppPost.sorted : AppPost.published.sorted
        @pagy, @app_posts = pagy(@app_posts)
         rescue Pagy::OverflowError
        redirect_to root_path(page: 1)
    end  
    
    
    def show
        # @app_post = AppPost.find(params[:id])
        # rescue ActiveRecords::RecordNotFound
        # redirect_to root_path
    end

    def new
        @app_post = AppPost.new
    end

    def create
        @app_post = AppPost.new(app_post_params)
        if @app_post.save
            redirect_to @app_post
        else
        render :new, status: :unprocessable_entity
    end
end

def edit
    # @app_post = AppPost.find(params[:id])
end

def update
    # @app_post = AppPost.find(params[:id])
    if @app_post.update(app_post_params)
        redirect_to @app_post
    else
        render :edit, status: :unprocessable_entity
   end
end

def destroy
    # @app_post = AppPost.find(params[:id])
    @app_post.destroy
    # redirect_to root_path
    respond_to do |format|
    format.html { redirect_to root_path }
        format.js
      end
end

def comment
    @app_post = AppPost.find(params[:id])    
    respond_to do |format|
      format.js
    end
end
  

private

   def app_post_params
         params.require(:app_post).permit(:title, :content, :cover_image, :published_at)
    end
end

def set_app_post
    @app_post = user_signed_in? ? AppPost.find(params[:id]) : AppPost.published.find(params[:id])
rescue ActiveRecord::RecordNotFound
    redirect_to root_path
end