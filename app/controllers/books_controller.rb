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

  get '/books/new' do
    if logged_in?
      erb :"books/new"
    else
      redirect to '/login'
  end
end

post '/books' do
    @book = Book.new(description: params[:content], status: "WL")
    @book.user = current_user
    if @tweet.save
      redirect "/books/#{@book.id}"
    else
      redirect "/books/new"
    end
  end

  get '/books/:id' do
    if !logged_in?
      redirect "/login"
    else
      @book = Book.find(params[:id])
      @user = @book.user
      erb :"/books/show_book"
    end
  end

  get '/books/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      @book = Book.find(params[:id])
      if @book.user = current_user
        @user = current_user
        erb :"/books/edit_book"
      else
        redirect '/books'
      end
    end
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    @book.update(description: params[:content], status: params[:status])
    if @tweet.save
      redirect "/books/#{@book.id}"
    else
      redirect "/books/#{@book.id}/edit"
    end
  end

  delete '/tweets/:id/delete' do
    if !logged_in?
      redirect '/login'
    else
      @book = Book.find(params[:id])
      if @book.user != current_user
        redirect '/books'
      else
        @book.delete
        redirect '/books'
      end
    end
  end


end
