class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build#commentを取得してからcommentをbuildしている。まずはbuildをして空の箱をつくる
  end
end