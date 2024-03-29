class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @blogs = Blog.order(id: "DESC")
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = Comment.new
    @comments = @blog.comments.includes(:user)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog),notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    if @blog.user !=  current_user
      redirect_to blogs_path,alert: "不正なアクセスです"
    end
  end


  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
    redirect_to blog_path(@blog),notice: "投稿に成功しました"
    else
    render :edit
    end
   end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to user_path(blog.user), notice: "レシピを削除しました。"
  end

  def search
    @blogs = Blog.search(params[:keyword])
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:body,:image)
  end
end
