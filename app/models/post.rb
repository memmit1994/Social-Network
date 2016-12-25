class Post < ApplicationRecord

    validates_presence_of :content

    belongs_to :user
    has_many :comments

    acts_as_likeable

    acts_as_mentioner

    has_attached_file :photo
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
