class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show]
  before_action :require_same_blogger, only: [:destroy]

  #GET - show all blogs
  def index
    @blogs = Blog.all
  end

  #GET - show a specific blog
  def show
  end

  #GET - request page to create a new blog with form to create a blog
  def new
    @blog = Blog.new 
  end

  #POST - actually create the blog
  def create
    # @blog = Blog.new(blog_params)
    @blog = helpers.current_user.blogs.new(blog_params)

    if @blog.save
      flash[:notice] = "Blog successfully saved"
      redirect_to blogs_path
    else 
      flash[:notice] = "There was an error creating a blog"
      render :new, status: :unprocessable_entity
    end
  end

  #GET - edit blog (the edit screen, not the act of saving the update)
  def edit
  end

  #PATCH? Update existing blog
  def update 
    if @blog.update(blog_params)
      redirect_to blogs_path
    else 
      flash[:notice] = "There was an error updating blog"
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy 
    @blog.destroy
    redirect_to blogs_path
  end

  private 
  
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def require_same_blogger
    if helpers.current_user != @blog.user 
      flash[:notice] = "Unauthorized action attempt!" 
      redirect_to helpers.current_user
    end
  end
  
  def blog_params
    params.require(:blog).permit(:title, :content, :image_path, category_ids: [])
  end

end
