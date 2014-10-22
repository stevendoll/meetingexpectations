json.(@post, :id, :title, :creator_id, :tag_list, :body, :privacy, :picture_url, :picture_original_url, :picture_thumb_url, :audio_url, :number_of_likes, :number_of_plays, :created_at, :updated_at, :published_at)

json.creator @post.creator, :id, :name, :full_name, :description, :avatar_url, :audio_url

json.comments do
  json.array!(@post.comments) do |comment|
    if current_user == comment.user
      json.extract! comment, :id, :body, :created_at
    else
      json.extract! comment, :body, :created_at
    end
    json.url comment_url(comment)

    json.user do 
      json.name comment.try(:user).try(:name) 
      json.full_name comment.try(:user).try(:full_name) 
      json.description comment.try(:user).try(:description) 
      json.avatar_url comment.try(:user).try(:avatar_url) 
      json.audio_url comment.try(:user).try(:audio_url) 
    end
  end
end

json.tags do
  json.array!(@post.tags) do |tag|
    json.extract! tag, :name
  end
end

json.likes do
  json.array!(@post.ratings) do |rating|
    json.user do 
      json.name rating.try(:user).try(:name) 
      json.full_name rating.try(:user).try(:full_name) 
      json.description rating.try(:user).try(:description) 
      json.avatar_url rating.try(:user).try(:avatar_url) 
      json.audio_url rating.try(:user).try(:audio_url) 
    end
  end
end

json.i_like do
  json.id @post.ratings.where(user: current_user).where(rating_type: 'Like').try(:first).try(:id)
end

if current_user.has_role? :admin
  json.shared_with do
    json.array!(@post.friends) do |friend|
      json.extract! friend, :id, :name, :full_name, :description, :avatar_url, :audio_url
    end
  end
end





