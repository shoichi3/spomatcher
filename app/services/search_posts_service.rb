class SearchPostsService
  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search}%").includes([:user, :tags])
    else
      Post.all.includes([:user, :tags])
    end
  end
end
