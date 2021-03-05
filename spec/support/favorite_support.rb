module FavoriteSupport
  def favorite
    find('.post-link').click
    find('.fa-star').click
    expect(page).to have_css '.fas'
  end
end
