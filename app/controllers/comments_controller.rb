class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    
  end
  
  def index
  
  end
  
  def create
    #binding.pry
    if params[:comment].present?
      aaa = Comment.new(user_id:current_user.id, classwork_id:params[:id], content:params[:comment])
      aaa.save
    end
    if params[:picture].present?
      bbb = Picture.new(user_id:current_user.id, classwork_id:params[:id], description:params[:description], image:params[:picture])
      bbb.save
    end
    redirect_to comments_new_path
  end
  
end
