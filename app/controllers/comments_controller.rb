class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
  end
  
  def index
    @comments = Comment.all
  end
  
  def create
    #binding.pry
    if params[:comment].present?
      @comment = Comment.new(user_id:current_user.id, classwork_id:params[:id], content:params[:comment])
      @comment.save
    end
    if params[:picture].present?
      @picture = Picture.new(user_id:current_user.id, classwork_id:params[:id], description:params[:description], image:params[:picture])
      @picture.save
    end
    redirect_to comments_index_path
  end
  
end
