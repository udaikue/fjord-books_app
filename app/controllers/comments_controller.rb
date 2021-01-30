# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    comment = @commentable.comments.new(comment_params)
    comment.user = current_user
    comment.save!
    redirect_to @commentable
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_commentable
    if params[:book_id]
      @commentable = Book.find(params[:book_id])
    elsif params[:report_id]
      @commentable = Report.find(params[:report_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
