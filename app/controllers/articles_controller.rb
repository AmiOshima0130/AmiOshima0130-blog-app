class ArticlesController < ApplicationController
    before_action :set_article, only: [:show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]#ユーザー登録をしていないと操作できないようにする

    def index
      @articles = Article.all
    end

    def show
    end

    def new
      @article = current_user.articles.build
    end

    def create
      @article = current_user.articles.build(article_params)
      if @article.save
        redirect_to article_path(@article), notice: '保存できたよ'
      else
        flash.now[:error] = '保存に失敗しました'
        render :new
      end
    end

    def edit
      @article = current_user.articles.find(params[:id])#セキュリティーに関わるので必ずcurrent_user=自分のみが更新できるように。
    end

    def update
      @article = current_user.articles.find(params[:id])
      if @article.update(article_params)
        redirect_to article_path(@article), notice: '更新できました'
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end

    def destroy
      article = current_user.articles.find(params[:id])
      article.destroy!#!は例外が発生したときに処理をストップさせる
      redirect_to root_path, notice: '削除に成功しました'
    end

    private
    def article_params#更新するタイトルを付けて○○_paramsとする。paramsのtitleとcontentだけ保存する。
      params.require(:article).permit(:title, :content)
      #articleキーの中のtitleとcontentだけ保存を許す
    end

    def set_article
      @article = Article.find(params[:id])
    end
  end
