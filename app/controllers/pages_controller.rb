class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query OR source ILIKE :query"
      @articles = Article.where(sql_query, query: "%#{params[:query]}%")
    else
      @articles = Article.all
    end

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @assets = Asset.where(sql_query, query: "%#{params[:query]}%")
    else
      @assets = Asset.all
    end

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @etfs = Etf.where(sql_query, query: "%#{params[:query]}%")
    else
      @etfs = Etf.all
    end
  end
end
