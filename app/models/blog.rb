class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  attachment :image

  with_options presence: true do
    validates :title
    validates :body
    validates :image

  end

end  
