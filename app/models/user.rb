class User < ApplicationRecord

    validates_presence_of :fname, :lname, :gender, :birthdate

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    enum gender: [:male, :female]

    enum marital_status: [:single, :engaged, :married]

    has_many :posts

    has_many :friendships, :foreign_key => 'user1_id',
        :class_name => 'Friendship'

    has_many :friends, :through => :friendships

    acts_as_voter

    self.per_page = 10

    has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    include Filterable

end
