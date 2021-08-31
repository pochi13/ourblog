class Favarite < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  varidates_uniqueness_of :blog_id, scope: :user_id
end
