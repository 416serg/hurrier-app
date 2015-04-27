class PicController < ApplicationController
    def favorite
        if current_user.present?
          pic = Pic.find(params[:url])
          FavPic.create pic: pic, user: current_user
          # user and pic automaically have this `FavPic` assigned
        end
    end
end
