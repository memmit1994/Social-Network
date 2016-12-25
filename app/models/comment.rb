class Comment < ApplicationRecord
    include ActAsCommentable::Comment

    validates_presence_of :content
    validates_presence_of :commentable
    validates_presence_of :user

    belongs_to :post
    belongs_to :user

    belongs_to :commentable, polymorphic: true, counter_cache: true
    default_scope -> { order('created_at DESC') }

    include PublicActivity::Model
    tracked only: [:create], owner: proc { |_controller, model| model.user }
end
