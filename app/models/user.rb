class User
  include Mongoid::Document
  rolify
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:phone_number]

  devise :database_authenticatable, :registerable,
         :rememberable, :authentication_keys => [:phone_number]

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  #validates_presence_of :email
  validates_presence_of :encrypted_password

  # From Devise module Validatable
  # validates_presence_of   :email, if: :email_required?
  # validates_uniqueness_of :email, allow_blank: true, if: :email_changed?
  # validates_format_of     :email, :with => '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b', allow_blank: true, if: :email_changed?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  # validates_length_of       :password, within: password_length, allow_blank: true

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # run 'rake db:mongoid:create_indexes' to create indexes

  field :user_type, :type => String # "geren", "gongsi", "lietou"
  field :company_name, :type => String
  field :phone_number, :type => String
  validates_uniqueness_of :phone_number

  field :locate_province, :type => String
  field :locate_city, :type => String
  #field :locate_region, :type => String

  #index({ email: 1 }, { unique: true, background: true })
  field :user_name, :type => String
  validates_presence_of :user_name, :phone_number, :locate_province
  validates_presence_of :company_name, if: :company_type?

  attr_accessible :user_type, :company_name, :phone_number, :locate_province, :locate_city, :user_name, :email, :password, :password_confirmation, :remember_me, :created_at, :updated_at

  protected
    # From Devise module Validatable
    def password_required?
      !persisted? || !password.nil? || !password_confirmation.nil?
    end

    # From Devise module Validatable
    def email_required?
      false
    end

    def company_type?
      !user_type.blank? && ( user_type == 'gongsi' or user_type == 'lietou' )
    end
end
