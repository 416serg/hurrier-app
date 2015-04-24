class PicController < ApplicationController
    def favorite
        pic = Pic.find(params[:url])

        favorite = FavPic.new
        favorite.pic = pic
        favorite.user = current_user # however you get at this...
        favorite.save

        pic.fav_users.add(favorite)
        pic.save

        current_user.fav_pics.add(favorite)
        current_user.save
    end
end
