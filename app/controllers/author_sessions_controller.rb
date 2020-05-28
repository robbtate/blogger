class AuthorSessionsController < ApplicationController
    def new
    end
  
    def create
      if login(params[:email], params[:password])
        redirect_back_or_to(articles_path, notice: 'Logged in successfully.')
      else
        flash.now.alert = "Login failed."
        render action: :new
      end
    end
  
    def destroy
      logout
      redirect_to(:authors, notice: 'Logged out!')
    end
    before_filter :zero_authors_or_authenticated, only: [:new, :create, :destroy]

    def zero_authors_or_authenticated
        redirect_to root_path
    end
end