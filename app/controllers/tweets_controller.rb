class TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.create(tweet_params)
    redirect_to user_tweets_path and return
  end 

  def index
    render layout: false
  end

  private 

  def tweet_params
    params.require(:tweet).permit(:description)
  end 
end