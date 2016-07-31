class PostsController < ApplicationController # :nodoc:
  def index
    @post = Post.new
    @posts = Post.latest
    respond_to :html
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post created.'
    else
      flash[:error] = @post.errors.full_messages.join ' & '
    end
    redirect_to root_url
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    flash[:success] = 'Post deleted.'
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
