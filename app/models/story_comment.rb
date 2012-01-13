class StoryComment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user
  validates :comment,:presence   => true,
                     :length     => { :within => 10..255 }
                     
end
