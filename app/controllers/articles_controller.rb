class ArticlesController < ApplicationController
  http_basic_authenticate_with name:"zhangchen",password:"1234",except:[:index,:show]

  def index
    @articles = Article.all
  end

	def new  
	end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

	def create
		@article = Article.new(params.require(:article).permit(:title,:text))
		@article.save
		redirect_to @article
	end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
      # @article = Article.find(params[:id])
      #if @article.change_date
      # redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
   
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  end

