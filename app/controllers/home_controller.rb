class HomeController < ApplicationController
    def index
        @article = Article.first#firstは一番最初の情報をとってくる。@articleでview側にarticleの情報を渡す
    end

    def about
        render 'home/about'
    end
end