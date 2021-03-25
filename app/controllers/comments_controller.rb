class CommentsController < ApplicationController
  def create
    if @comment = Comment.new(comment_params)
      if @comment.save
        redirect_tp prototype_path(prototype.id) 
      else
        @prototype = @comment.text
        @comments = @prptotype.comments
        render "tweets/show" # views/tweets/show.html.erbのファイルを参照しています。
      end
    end             
  end


private

def comment_params
  params.require(:comment).permit(:text ).merge(user_id: prototype_id:)
end