module FollowUserService
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end
end