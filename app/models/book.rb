class Book < ApplicationRecord

  belongs_to :user, optional: true
  attachment :profile_image


  validates :title, presence: true
  validates :body, presence: true

end
