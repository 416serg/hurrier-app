class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first || create_from_omniauth(auth)
    user.oauth_token = auth["credentials"]["token"]
    user.oauth_secret = auth["credentials"]["secret"]
    user.save!
    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def twitter
    if provider == "twitter"
      @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
    end
  end

  has_many :fav_pics
  has_many :pics_favorited,
    class_name: 'Pic',
    through: :fav_pics

end

class FavPic < ActiveRecord::Base
  belongs_to :user
  belongs_to :pic
end

class Pic < ActiveRecord::Base
  has_many :fav_pics
  has_many :fav_users,
    class_name: 'User',
    through: :fav_pics
end
