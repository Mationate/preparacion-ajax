class PostsController < ApplicationController
  before_action :post_params, only: []
  def index
    @posts = Post.order('id DESC')
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      respond_to :js
    else
      redirect_to root_path, alert: 'Error al crear el post, intente nuevamente'
    end
    
  end
  
  private 

  def post_params
    params.require(:post).permit(:title, :content)
  end
  
  
end
