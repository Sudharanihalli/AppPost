require 'rails_helper'

RSpec.describe "AppPosts", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "displays a list of app posts" do
    FactoryBot.create(:app_post, title: "Post 1", body: "Body 1")
    FactoryBot.create(:app_post, title: "Post 2", body: "Body 2")

    visit app_posts_path

    expect(page).to have_content("Post 1")
    expect(page).to have_content("Post 2")
  end

  it "loads the show page with the AppPost" do
    app_post = FactoryBot.create(:app_post, title: "New App Post")

    visit app_post_path(app_post)

    expect(page).to have_content("New App Post")

    
  end
end
