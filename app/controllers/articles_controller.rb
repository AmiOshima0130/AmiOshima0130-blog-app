class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end
   
    def create
      @article = Article.new(article_params)#データを保存する箱
      @article.save#データを保存
      if @article.save#もしデータが保存されていたらページに飛ぶ
         redirect_to article_path(@article)
      else
         render :new
      end
    end
    
    private
    def article_params
      params.require(:article).permit(:title, :content)
    end
  end
