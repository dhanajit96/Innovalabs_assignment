class BlogsController < ApplicationController
  def index
    @all_blogs = Blog.all
  end

  def new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: "Blog is created successfully!"
    else
      redirect_to :new, notice: "fail to created Blog!"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body, :author)
  end
end
