class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :drivets
  has_many :relationships
  has_many :friends, through: :relationships

  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_relationships, source: :user

  has_many :likes

  validates :username, presence: true
  validates :username, presence: true, uniqueness: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  attr_accessor :remove_avatar
  before_validation { avatar.clear if remove_avatar == '1' }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def likes?(drivet)
    drivet.likes.where(user_id: id).any?
  end

end
