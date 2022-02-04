class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def index
    @comments = Comment.all
  end
  
  def create_comment
    @comment = Comment.new(user_id:current_user.id, classwork_id:params[:id], **comment_params )
    #binding.pry
    if @comment.save
      redirect_to comments_index_path, success: "コメントの投稿に成功しました"
    else
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render :new
    end
    
  end
  
  def create_picture
    @picture = Picture.new(user_id:current_user.id, classwork_id:params[:id], **picture_params)
    #binding.pry
    if @picture.save
      redirect_to pictures_index_path, success: "画像の投稿に成功しました"  
    else
      flash.now[:danger] = "画像の投稿に失敗しました"
      render :new
    end
  end
  
  
  
  
  # def create
  #   #binding.pry
  #   if params[:comment].present?
  #     @comment = Comment.new(user_id:current_user.id, classwork_id:params[:id], content:params[:comment])
  #     @comment.save
  #   end
  #   if params[:picture].present?
  #     @picture = Picture.new(user_id:current_user.id, classwork_id:params[:id], description:params[:description], image:params[:picture])
  #     @picture.save
  #   end
  #   redirect_to comments_index_path
  # end
  
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  private
  def picture_params
    params.require(:picture).permit(:description, :image)
  end
  
end
