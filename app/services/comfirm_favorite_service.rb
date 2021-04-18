module ComfirmFavoriteService
  def liked_by?(user, post)
    Favorite.where(user_id: user.id, post_id: post.id).exists?
  end
end
