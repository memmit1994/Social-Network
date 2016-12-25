class Follow < ActiveRecord::Base

    extend ActsAsFollower::FollowerLib
    extend ActsAsFollower::FollowScopes

    # NOTE: Follows belong to the "followable" interface, and also to followers
    belongs_to :followable, :polymorphic => true
    belongs_to :follower, :polymorphic => true

    validates_presence_of :followable
    validates_presence_of :follower

    def block!
        self.update_attribute(:blocked, true)
    end

    include PublicActivity::Model
    tracked only: [:create], owner: Proc.new { |controller, model| model.follower }

end
