class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable, :recoverable,
          :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :image
  
  # attr_accessible :title, :body
  has_many :pins, dependent: :destroy
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_reputation :votes, source: {reputation: :votes, of: :pins}, aggregated_by: :sum
  has_attached_file :image, styles: { tiny:  "30x30#",
    :thumbnail => "60x60#"},
    :default_url => "/assets/default_tiny.png"
  #validates_attachement :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
   #                              size: {less_than: 1.megabytes}

  def voted_for?(pin)
  	evaluations.where(target_type: pin.class, target_id: pin.id).present?
  end
def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.nickname
  end
end

def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
      user.attributes = params
      user.valid?
    end
  else
    super
  end
end

def password_required?
  super && provider.blank?
end

def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end
end