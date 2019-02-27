class ArticlesController < ApplicationController
  before_action :login_required, except: [:index, :show]

  #記事一覧
  def index
    @articles = Article.order(released_at: :desc)
  end
  def show
    @article = Article.find(params[:id])
  end

  # 新規登録フォーム
  def new
    @article = Article.new
  end

  # 編集フォーム
  def edit
    @article = Article.find(params[:id])
  end

  #新規作成
  def create
    @article = Article.new(params[:id])
    if @article.save
      redirect_to @article, notice: "ニュース記事を登録しました。"
    else
      render "new"
    end
  end
  
  #更新
  def update
    @article = Article.find(params[:id])
    @article.assign_attributes(params[:article])
    if @article.save
      redirect_to @article, notice: "ニュース記事を更新しました。"
    else
      render "edit"
    end
  end
end
