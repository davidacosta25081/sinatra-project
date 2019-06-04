class BooksController < ApplicationController

  get '/books' do
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      @books = Book.order("id desc")
      erb :"/books/books"
    end
  end

end
