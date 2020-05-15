class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    @reply   = Comment.new
  end

  def create
    if !params[:comment][:to_portfolio].nil?
      save_portfolio_comment
    elsif !params[:comment][:to_comment].nil?
      save_comment_reply
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).delete :to_portfolio
    params.require(:comment).delete :to_comment
    return params.require(:comment).permit(:message)
  end

  def save_portfolio_comment
    portfolio = Portfolio.find(params[:comment][:to_portfolio])
    comment = Comment.new(comment_params)
    comment.portfolio = portfolio
    comment.user = current_user
    if comment.valid?
      portfolio.comments << comment
      redirect_back_or portfolio
    else
      log_out
      redirect_to login
    end
  end

  def save_comment_reply
    base_comment = Comment.find(params[:comment][:to_comment])
    comment = Comment.new(comment_params)
    comment.base = base_comment
    comment.user = current_user
    if comment.save!
      base_comment.replies << comment
      redirect_back_or root_url
    else
      log_out
      redirect_to login
    end
  end
end
