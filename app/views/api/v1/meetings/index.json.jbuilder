json.shared_with_me do
  json.array!(@shared_posts) do |post|
    json.extract! post, :id, :title, :creator_id, :tag_list, :body, :privacy, :picture_url, :picture_thumb_url, :picture_square_url, :audio_url, :number_of_likes, :number_of_plays, :created_at, :updated_at, :published_at
    json.displayed_at post.shares.where(shared_with: current_user).first.created_at
    json.url post_url(post)

    json.creator do 
      json.name post.try(:creator).try(:name) 
      json.full_name post.try(:creator).try(:full_name) 
      json.description post.try(:creator).try(:description) 
      json.avatar_url post.try(:creator).try(:avatar_url) 
      json.audio_url post.try(:creator).try(:audio_url) 
    end

    json.comments do
      json.array!(post.comments) do |comment|
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
      json.array!(post.tags) do |tag|
        json.extract! tag, :name
      end
    end

    json.likes do
      json.array!(post.ratings) do |rating|
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
      json.id post.ratings.where(user: current_user).where(rating_type: 'Like').try(:first).try(:id)
    end

    if current_user.has_role? :admin
      json.shared_with post.friends, :name, :full_name, :description, :avatar_url, :audio_url
    end

  end
end

json.all_posts do
  json.array!(@all_posts) do |post|
    json.extract! post, :id, :title, :creator_id, :tag_list, :body, :privacy, :picture_url, :picture_thumb_url, :picture_square_url, :audio_url, :number_of_likes, :number_of_plays, :created_at, :updated_at, :published_at
    json.displayed_at post.published_at
    json.url post_url(post)

    json.creator do 
      json.name post.try(:creator).try(:name) 
      json.full_name post.try(:creator).try(:full_name) 
      json.description post.try(:creator).try(:description) 
      json.avatar_url post.try(:creator).try(:avatar_url) 
      json.audio_url post.try(:creator).try(:audio_url) 
    end

    json.comments do
      json.array!(post.comments) do |comment|
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
      json.array!(post.tags) do |tag|
        json.extract! tag, :name
      end
    end

    json.likes do
      json.array!(post.ratings) do |rating|
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
      json.id post.ratings.where(user: current_user).where(rating_type: 'Like').try(:first).try(:id)
    end

    if current_user.has_role? :admin
      json.shared_with post.friends, :name, :full_name, :description, :avatar_url, :audio_url
    end

  end
end

json.my_posts do
  json.array!(@my_posts) do |post|
    json.extract! post, :id, :title, :creator_id, :tag_list, :body, :privacy, :picture_url, :picture_original_url, :picture_thumb_url, :picture_square_url, :audio_url, :number_of_likes, :number_of_plays, :created_at, :updated_at, :published_at
    json.displayed_at post.created_at
    json.url post_url(post)

    json.creator do 
      json.name post.try(:creator).try(:name) 
      json.full_name post.try(:creator).try(:full_name) 
      json.description post.try(:creator).try(:description) 
      json.avatar_url post.try(:creator).try(:avatar_url) 
      json.audio_url post.try(:creator).try(:audio_url) 
    end

    json.comments do
      json.array!(post.comments) do |comment|
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
      json.array!(post.tags) do |tag|
        json.extract! tag, :name
      end
    end

    json.likes do
      json.array!(post.ratings) do |rating|
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
      json.id post.ratings.where(user: current_user).where(rating_type: 'Like').try(:first).try(:id)
    end

    if current_user.has_role? :admin
      json.shared_with post.friends, :name, :full_name, :description, :avatar_url, :audio_url
    end


  end
end

json.my_profile do
  json.name current_user.name
  json.first_name current_user.first_name
  json.last_name current_user.last_name
  json.full_name current_user.full_name
  json.email current_user.email
  json.phone current_user.phone
  json.age current_user.age
  json.gender current_user.gender
  json.account_type current_user.account_type
  json.account_active current_user.account_active
  json.accepts_friend_requests current_user.accepts_friend_requests
  json.description current_user.description
  json.avatar_url current_user.avatar_url
  json.audio_url current_user.audio_url
end

