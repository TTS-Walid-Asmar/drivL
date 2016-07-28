class Drivet < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  validates :message, presence: true, length: {maximum: 140, too_long: "A drivet is limited to 140 characters."}

end
