class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each_with_index do |x,index|
      if index % 5 == 0
        x.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
