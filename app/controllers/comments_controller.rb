class CommentsController < ApplicationController
    def create
        tweet = Tweet.find(params[:tweet_id])
        comment = current_user.comments.build(comment_params)
        # これは comment = Comment.new(comment_params)と
        #       comment.user_id = current_user.id
        comment.tweet_id = tweet.id
        comment.save
        redirect_to tweet_path(tweet.id)
    end


    private
        def comment_params
            params.require(:comment).permit(:body)
        end
end
