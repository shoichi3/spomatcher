module FollowSupport
  def follow
    find('.icon').click
    find('#follow_form').click
    expect(page).to have_content('フォロー中')
  end
end
