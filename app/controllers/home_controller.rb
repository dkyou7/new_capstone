class HomeController < ApplicationController
  def index
    @post = Post.all
  end

  def new
  end

  def create
    @post = Post.new
    @post.title = params[:title]
    @post.content = params[:content]
    require 'digest'
    @post.hashstring = Digest::SHA256.hexdigest @post.content
    @post.save
    
    redirect_to '/index'
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    post.title = params[:title]
    post.content = params[:content]
    post.save
    
    redirect_to '/index'
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to '/index'
  end
end
