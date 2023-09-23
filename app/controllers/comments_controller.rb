class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])#articleがあってcommentがある
    @comment = article.comments.build#commentを取得してからcommentをbuildしている。まずはbuildをして空の箱をつくる
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
        redirect_to article_path(article), notice: 'コメントを追加'
    else
        flash.now[:error] = '更新できませんでした'
        render :new
    end
  end

  private
  def comment_params#paramsはprivateで
    params.require(:comment).permit(:content)#contentが入力されているcommentだけ許可
  end
end