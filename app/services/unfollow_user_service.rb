module UnfollowUserService
  def unfollow(user)
    following_user = following_relationships.find_by(following_id: user.id)
    following_user.destroy
  end
end
