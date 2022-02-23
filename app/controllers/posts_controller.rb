class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sport
  before_action :set_post, only: [:update, :show, :destroy]
  
  #GET/sports/:sport_id/posts
  def index
    posts = @sport.posts(page).per(per_page)
    render_success 200, true, 'Posts fetched successfully', posts.as_json
  end

  # GET/sports/:sport_id/posts
  def show
    render_success 200, true, 'Post fetched successfully', @post.as_json
  end

  # POST/sports/:sport_id/posts
  def create
    post = @sport.posts.new(post_params)
    if post.save
      render_success 200, true, 'Post created successfully', post.as_json
    else
      if post.errors
        errors = post.errors.full_messages.join(", ")
      else
        errors = 'Post creation failed'
      end
      return_error 500, false, errors, {}
    end
  end

  # PUT/PATCH /sports/:sport_id/posts
  def update
    if @post.update(post_params)
      render_success 200, true, 'Post updated successfully', @post.as_json
    else
      if @post.errors
        errors = @post.errors.full_messages.join(", ")
      else
        errors = 'Post update failed'
      end
      return_error 500, false, errors, {}
    end
  end

  # DELETE /sports/:sport_id/posts
  def destroy
    @post.destroy
    render_success 200, true, 'Post deleted successfully', {}
  end

  private
  def set_sport
    @sport = Sport.where(id: params[:sport_id]).first
    
      unless @sport
          return return_error 404, false, 'Post not found', {}
      end
  end

  # Params of Post
  def post_params
    params.require(:post).permit(:title,:description,:image,:sport_id,:user_id)
  end

  # Set post Object, Return Error if not found
  def set_post
    @post = @sport.posts.where(id: params[:id]).first

    unless @post
      return return_error 404, false, 'Post not found', {}
    end
  end

  def page
    @page ||= params[:page] || 1
  end
    
  def per_pag
    @per_page ||= params[:per_page] || 5
  end
end