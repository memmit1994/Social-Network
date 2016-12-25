class Post < ApplicationRecord

    validates_presence_of :content

    belongs_to :user
    has_many :comments

    acts_as_likeable
end
