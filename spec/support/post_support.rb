module PostSupport
  def post(post)
    find(".fa-edit").click
      expect(current_path).to eq new_post_path
      fill_in 'post_title', with: post.title
      image_path = Rails.root.join('app/assets/images/0116.png')
      attach_file('post[image]', image_path, make_visible: true)
      fill_in 'post_tag_list', with: post.tag_list
      fill_in 'post_sports', with: post.sports
      fill_in 'post_datetime', with: post.datetime
      fill_in 'post_regular_date', with: post.regular_date
      fill_in 'post_address', with: post.address
      fill_in 'post_cost', with: post.cost
      fill_in 'post_content', with: post.content
      fill_in 'post_flow', with: post.flow
      expect{
        click_button '投稿する'
      }.to change { Post.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content post.title
  end
end