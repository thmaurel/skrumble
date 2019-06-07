class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  mount_uploader :photo, PhotoUploader

  has_many :trips

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :surname, presence: true
  validates :email, presence: true, uniqueness: true

  def self.find_for_facebook_oauth(auth, i)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20] # Fake password for validation
      user.save
    end

    return user
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
    logger.info e.to_s
    nil
  end

  def api_call
    query = "Me?fields=picture.type(large),location,events.fields(name,location,end_time,privacy,updated_time,description,rsvp_status,venue,start_time,id,ticket_uri,picture.type(large),cover,owner,admins.fields(picture.type(large),name,location),attending.fields(picture.type(large),name,rsvp_status,first_name,last_name,email,location),maybe.fields(rsvp_status,picture.type(large),name,first_name,last_name,email,age_range,location)),friends.fields(cover,id,gender,location,username,email,first_name,last_name,picture.type(large))"
  end

  def generate_user_events
    fb_call = facebook { |fb| fb.graph_call(api_call)}

    unless fb_call["events"].nil?
      events = fb_call["events"]["data"]
      events.each do |event|
        #All information from each event.
      end #/ each do |event|
    end #/ check to see if user has events
  end
end
