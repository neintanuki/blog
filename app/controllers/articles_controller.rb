class ArticlesController < ApplicationController
  def index
    @article = Article.all
  end

  def new
    @article_model = Article.new
  end

  def publish
    case request.method_symbol
    when :post
      @article = Article.create(
        title: params[:title],
        author: params[:author],
        body: params[:body]
      )
  
      if @article.save
        flash[:success] = true
        flash[:message] = "Blog Published"
        
        redirect_to '/status/created'
      else
        @errors = @article.errors
        flash[:title] = @errors[:title]
        flash[:author] = @errors[:author]
        flash[:body] = @errors[:body]
        flash[:class] = 'is-invalid'
        redirect_to '/publish'
      end
      
    end
  end

  def read
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(title: params[:title], author: params[:author], body: params[:body])
      redirect_to '/status/updated'
    else
      flash[:status] = 'Something went wrong. Please try again'
      redirect_to '/edit'
    end
  end

  def delete
    Article.destroy_by(id: params[:id])

    redirect_to '/status/deleted', status: 303
  end

  def search
    @article = Article.where("title ILIKE ?", "%#{params[:q]}%")
  end
end
