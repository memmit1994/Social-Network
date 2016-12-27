class Friendship < ApplicationRecord
  belongs_to :person, :foreign_key => 'user1_id', :class_name => 'User'
  belongs_to :friend, :foreign_key => 'user2_id', :class_name => 'User'
end
