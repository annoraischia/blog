class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            flash[:notice] = 'Article was successfully created'
            redirect_to articles_path
        else
            flash[:error] = 'Errors encountered'
            render :new
        end
    end

    def edit
    end

    def update
       if @article.update(article_params)
            redirect_to articles_path, notice: 'Article was successfully updated'
        else
            flash[:error] = 'Errors encountered'
            render :edit

        end
    end

    def destroy
        @article.destroy

        redirect_to articles_path, notice: 'Article was successfully destroyed'
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :author, :content)
    end
end