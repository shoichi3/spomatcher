module ReviewSupport
  def review(review)
    find('.post-link').click
    find('.icon').click
    find('#count').click
    click_on 'レビューを書く'
    page.all('.fa-star')[4].click
    fill_in 'review_content', with: review.content
    expect  do
      click_button '投稿する'
    end.to change { Review.count }.by(1)
    expect(page).to have_css '.review'
  end
end
