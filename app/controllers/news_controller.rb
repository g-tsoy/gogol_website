class NewsController < ApplicationController

  def view
    @post = Micropost.find(params[:id])
  end
end