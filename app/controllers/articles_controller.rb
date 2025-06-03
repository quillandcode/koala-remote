class ArticlesController < ApplicationController
  def index
    render json: Article.all.order(published_at: :desc)
  end

  def create
    # Whitelist only the allowed parameters
    permitted_params = params.permit(:title, :content, :author, :category, :published_at)
  
    # Create the article object
    article = Article.new(permitted_params)

    # Return the article and a 201 status if created successfully
    if article.save
      render json: article, status: :created
    else
      render json: { errors: article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    # Making extra sure the id parameter is supplied
    unless params[:id].present?
      render json: {error: "No id given."}, status: :bad_request
      return
    end

    # Find the article by id
    article = Article.find_by(id: params[:id])

    # If the article exists, return it. Otherwise, report the failure
    if article
      render json: article
    else
      render json: {error: 'Article not found.'}, status: :not_found
    end
  end

end
