class Post < ApplicationRecord
    validates_presence_of :content
    validates_presence_of :user

    belongs_to :user

    has_attached_file :photo, styles: {medium: "300x300>", thumb: "100x100>", large: '900x300>'}
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

    acts_as_votable

    default_scope -> { order('created_at DESC') }
end
