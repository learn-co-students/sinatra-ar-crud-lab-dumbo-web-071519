
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  def find_article
    @article = Article.find_by(id: params[:id])
  end


  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    @article = Article.find_by(id: params[:id])
    erb :new
  end

  post '/articles' do
    puts params
    @article = Article.create(params[:article])
    redirect "/articles/#{@article.id}"
  end


  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find_by(id: params[:id])
    @article.update(params[:article])
    redirect "articles/#{@article.id}"
  end

  delete "articles/:id/"


end
