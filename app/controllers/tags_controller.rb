class TagsController < ApplicationController
    def show
        @tag = Tag.find(params[:id])
    end
    def index
        @tags = Tag.all
    end
    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        flash.notice = "Tag '#{@tag.name}' Destroyed!"
        redirect_to articles_path(@article)
      end
    before_filter :require_login, only: [:destroy]

    def require_login
        unless Author.count == 0 || current_user
            redirect_to root_path
        return false
        end
    end
end
