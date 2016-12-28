class Friendship < ApplicationRecord
    validates_presence_of :user1_id, :user2_id
    belongs_to :person, :foreign_key => 'user1_id', :class_name => 'User'
    belongs_to :friend, :foreign_key => 'user2_id', :class_name => 'User'
end
