class Comment < ApplicationRecord

    validates_presence_of :content

    belongs_to :post
    belongs_to :user

    acts_as_likeable
end
