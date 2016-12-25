class User < ApplicationRecord

    validates_presence_of :fname, :lname, :gender, :birthdate

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    enum gender: [:male, :female]

    enum marital_status: [:single, :engaged, :married]

    has_many :posts
    has_many :comments

    acts_as_follower
    acts_as_followable


    acts_as_mentionable

    acts_as_liker
end
