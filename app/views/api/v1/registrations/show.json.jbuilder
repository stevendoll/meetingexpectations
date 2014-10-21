json.profile do
  json.name current_user.name
  json.first_name current_user.first_name
  json.last_name current_user.last_name
  json.full_name current_user.full_name
  json.email current_user.email
  json.authentication_token current_user.authentication_token
  json.phone current_user.phone
  json.description current_user.description
  json.avatar_url current_user.avatar_url
end

