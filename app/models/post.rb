class Post < ApplicationRecord
    validates_presence_of :content
    validates_presence_of :user

    belongs_to :user

    has_attached_file :photo, styles: {medium: "300x300>", thumb: "100x100>", large: '900x300>'}
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

    counter_culture :user
    acts_as_votable

    include PublicActivity::Model
    tracked only: [:create, :like], owner: proc { |_controller, model| model.user }

    default_scope -> { order('created_at DESC') }
end
