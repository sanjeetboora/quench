class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum role: {guest: 0, member: 1, moderator: 2, admin: 3}
  validates :phno, length: {is: 10}
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
  def feed
    Question.includes(:user).order(created_at: :desc)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name=auth.info.name
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params,session)
    if session["devise.user_Attributes"]
      new(session["devise.user_Attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  # def password_required?
  #   super && provider.blank?
  # end
end
