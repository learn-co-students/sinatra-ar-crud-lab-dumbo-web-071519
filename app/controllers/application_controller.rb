
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
     set :method_override, true
  end
  
  #INDEX
  get '/articles' do
    @articles = Article.all
    #binding.pry
    erb :index
  end

  #NEW
  get '/articles/new' do
    erb :new
  end

  #CREATE
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  #SHOW
  get '/articles/:id' do
    find_article
    #@article = Article.find(params[:id])
    erb :show
  end

  #EDIT
  get '/articles/:id/:edit' do
    find_article
    # @article = Article.find(params[:id])
    erb :edit
  end

  #UPDATE
  patch '/articles/:id' do
    find_article
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  #DELETE
  delete '/articles/:id' do
    find_article
    @article.destroy
    redirect "/articles"
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
