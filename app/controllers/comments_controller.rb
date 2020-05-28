class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
      
        @comment.save
      
        redirect_to article_path(@comment.article)
      end
      
      def comment_params
        params.require(:comment).permit(:author_name, :body)
      end
      before_filter :authenticated, only: [:create]


      def authenticated
        unless Author.count == 0 || current_user
          redirect_to root_path
          return false
        end
      end
    end
end
