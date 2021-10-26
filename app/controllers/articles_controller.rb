class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index new ]

  # GET /articles or /articles.json
  def index
    @articles = policy_scope(Article)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'articles/list', locals: { articles: @articles }, formats: [:html] }
    end

    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query OR source ILIKE :query"
      @articles = Article.where(sql_query, query: "%#{params[:query]}%")
    else
      @articles = Article.all
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    authorize @article
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      authorize @article
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description, :link, :date, :source, :asset_id, :etf_id)
    end
end
