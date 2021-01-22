module FollowSupport
  def follow()
    find('.icon').click
    find('#follow_form').click
    expect(page).to have_css '.text-white'
  end
end