class Post < ApplicationRecord
    validates_presence_of :content
    validates_presence_of :user

    belongs_to :user
    has_many :comments

    has_attached_file :photo
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

    counter_culture :user
    acts_as_votable
    acts_as_commentable

    include PublicActivity::Model
    tracked only: [:create, :like], owner: proc { |_controller, model| model.user }

    default_scope -> { order('created_at DESC') }
end
