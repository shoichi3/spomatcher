module FollowSupport
  def follow
    find('.icon').click
    find('#follow_form').click
  end
end
