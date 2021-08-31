class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favarites, dependent: :destroy

  attachment :image

  with_options presence: true do
    validates :title
    validates :body
  end

    def self.search(search)
      if search != ""
        Blog.where('title LIKE(?)', "%#{search}%")
      else
        Blog.all
      end
    end
end  
