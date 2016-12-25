# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161225113754) do

    create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.text "content", limit: 65535
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.integer "post_id"
        t.integer "user_id"
        t.integer "likers_count", default: 0
        t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
        t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
    end

    create_table "follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "follower_type"
        t.integer "follower_id"
        t.string "followable_type"
        t.integer "followable_id"
        t.datetime "created_at"
        t.index ["followable_id", "followable_type"], name: "fk_followables", using: :btree
        t.index ["follower_id", "follower_type"], name: "fk_follows", using: :btree
    end

    create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "liker_type"
        t.integer "liker_id"
        t.string "likeable_type"
        t.integer "likeable_id"
        t.datetime "created_at"
        t.index ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
        t.index ["liker_id", "liker_type"], name: "fk_likes", using: :btree
    end

    create_table "mentions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "mentioner_type"
        t.integer "mentioner_id"
        t.string "mentionable_type"
        t.integer "mentionable_id"
        t.datetime "created_at"
        t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
        t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree
    end

    create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.text "content", limit: 65535
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.integer "user_id"
        t.string "photo_file_name"
        t.string "photo_content_type"
        t.integer "photo_file_size"
        t.datetime "photo_updated_at"
        t.integer "likers_count", default: 0
        t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
    end

    create_table "user_phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.integer "user_id"
        t.string "phone_number"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
    end

    create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
        t.string "fname"
        t.string "lname"
        t.string "nickname"
        t.integer "gender"
        t.date "birthdate"
        t.string "hometown"
        t.integer "marital_status"
        t.text "bio", limit: 65535
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.string "email", default: "", null: false
        t.string "encrypted_password", default: "", null: false
        t.string "reset_password_token"
        t.datetime "reset_password_sent_at"
        t.datetime "remember_created_at"
        t.integer "sign_in_count", default: 0, null: false
        t.datetime "current_sign_in_at"
        t.datetime "last_sign_in_at"
        t.string "current_sign_in_ip"
        t.string "last_sign_in_ip"
        t.integer "followees_count", default: 0
        t.integer "likees_count", default: 0
        t.integer "followers_count", default: 0
        t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
        t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    end

    add_foreign_key "comments", "posts"
    add_foreign_key "comments", "users"
    add_foreign_key "posts", "users"
end
