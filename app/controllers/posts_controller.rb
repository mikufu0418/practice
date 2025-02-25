class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: '投稿が完了しました。'
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '編集が完了しました。'
    else
      render :edit
    end
  end

  def destroy
      @post= Post.find(params[:id])
      @post.destroy
      redirect_to posts_path, notice: '削除が完了しました。', status: :see_other
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
