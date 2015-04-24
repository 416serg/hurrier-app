class WelcomeController < ApplicationController

  # GET /welcome
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "MYZAURN7b2hkhNgowEQiAucSH"
      config.consumer_secret     = "i3XK8eqvNyA0GBX3DtdmKR29KYvTBkUtcjG9KphOUWgMF20TZS"
      if current_user
        config.access_token        = current_user.oauth_token
        config.access_token_secret = current_user.oauth_secret
      end

    end

    if params[:username]
      @mentions = client.search("@"+ params[:username]).take(30).each do |tweet|
        puts tweet
      end
    else
      if current_user
        @mentions = client.mentions_timeline
      end
    end
  end

end
