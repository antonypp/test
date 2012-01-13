class Story < ActiveRecord::Base
  belongs_to :user 
  has_many :story_comments
  belongs_to :story_status
end
