require 'rails_helper'

RSpec.feature "AppPosts", type: :feature do
  let!(:app_post) { create(:app_post) } # Assuming you have a factory for creating app posts

  scenario 'User deletes an app post' do
    visit root_path

    # Ensure that the app post is on the page
    expect(page).to have_content('Edit App Post')

    # Click the delete link/button (adjust the selector based on your UI)
    save_and_open_page
    click_button 'delete-post-button'

    # Accept the confirmation dialog (if any)
    accept_confirm("Are you sure you want to delete this post?") do
    end
    # You may need to wait for the AJAX request to complete
    # Adjust the wait time based on your application's behavior
    sleep 1

    # Ensure that the app post is no longer on the page
    expect(page).not_to have_content(app_post.title)

    # Optionally, you can check that the record is deleted from the database
    expect(AppPost.exists?(app_post.id)).to be_falsey
  end
end