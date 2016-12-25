json.extract! post, :id, :content, :comments_count, :likes_count, :created_at, :updated_at
json.url post_url(post, format: :json)