class CommentsController < ApplicationController

  def create
    # No need for instance variable (@) since it has no dedicated views that uses it.
    comment = Comment.create(comment_params)
    if comment.save
      redirect_to prototype_path(comment.prototype_id)
    else
      # Need to re-fetch comments and prototype if it's just render.
      @prototype = comment.prototype
      @comments = @prototype.comments
      render 
    end
    
  end

  private
    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    end
end
