# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = load_post
  end

  def new
    @post_form = PostForm.new
  end

  def edit
    @post_form = PostForm.new(load_post)
  end

  def create
    @post_form = PostForm.new(**post_params)

    if @post_form.save
      redirect_to posts_path, notice: 'The post has been created.'
    else
      render :new
    end
  end

  def update
    @post_form = PostForm.new(load_post, **post_params)

    if @post_form.save
      redirect_to load_post, notice: 'The post has been updated.'
    else
      render :edit
    end
  end

  def destroy
    load_post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def load_post
    @load_post = Post.find(params[:id])
  end
end
