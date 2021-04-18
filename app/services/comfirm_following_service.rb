module ComfirmFollowingService
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end
end
