class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favarites, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         attachment :profile_image

    validates :username, presence: true    

    def already_favarited?(blog)
      self.favarites.exists?(blog_id: blog.id)
    end
  end
