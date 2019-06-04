class BooksController < ApplicationController

  get '/tweets' do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      @tweets = Tweet.order("id desc")
      erb :"/tweets/tweets"
    end
  end

end
