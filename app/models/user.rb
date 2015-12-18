class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX =
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  #has_secure_password
  validates :password, presence: true, length: { minimum: 5 },
    allow_blank: true

  has_many :user_courses
  has_many :courses, through: :user_courses

  has_many :subjects, through: :courses

  has_many :reports

  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  has_many :user_subjects
  has_many :course_subjects, through: :user_subjects

  scope :supervisors, -> {supervisor}
  scope :trainees, -> {trainee}

  enum role: [:supervisor, :trainee]

  class << self
    def from_omniauth auth
      where(provider: auth.provider,
        uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.email = auth.info.email
        user.uid = auth.uid
        user.name = auth.info.name
      end
    end

    def new_with_session params, session
      if session["devise.user_attributes"]
        new(session["devise.user_attributes"],
          without_protection: true) do |user|
          user.attributes = params
          user.valid?
        end
      else
        super
      end
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password params, *options
    if encrypted_password.blank?
      update_attributes params, *options
    else
      super
    end
  end

  include PublicActivity::Model
  tracked owner: ->(controller, model) {controller && controller.current_user}

end
