class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.create(comment_params)
      if @comment.save
        # redirect_to "/prototypes/#{comment.prototype.id}" 
         redirect_to prototype_path(params[:prototype_id])
      else
         @prototype = @comment.prototype
         @comments = @prototype.comments.includes(:user)
        #  @comments = @prptotype.comments
        render "prototypes/show" # views/tweets/show.html.erbのファイルを参照しています。
      end
  end             
  # createメソッドは引数にキーとバリューのセットの情報を渡します。

private

    def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id:  params[:prototype_id])
    end
end