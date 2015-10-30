class CommentsController < ApplicationController


  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create({content: params[:comment][:content], micropost_id: params[:micropost_id]})
    if @comment.save
      flash[:success] = "Comment created!"
    else
      flash[:danger] = 'Something went wrong'
      render 'static_pages/home'
    end
    redirect_to @micropost
  end
  
  
  private
  
    def comment_params
      params.require(:comment).permit(:content)
    end

end
