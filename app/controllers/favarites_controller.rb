class FavaritesController < ApplicationController

  def create
    
    @favatrite = current_user.favarites.create(blog_id: params[:blog_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    
    @blog = Blog.find(params[:blog_id])
    @favatrite = current_user.favarites.find_by(blog_id: @blog.id)
    @favatrite.destroy
    redirect_back(fallback_location: root_path)
  end  
end
