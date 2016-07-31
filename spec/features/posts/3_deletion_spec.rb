require 'spec_helper'

feature 'Post deletion' do
  before do
    create :post
  end

  scenario 'Deleting a post' do
    given_the_user_has_visted_the_timeline
    and_a_post_is_present
    when_the_user_deletes_a_post
    then_the_post_is_successfully_deleted
  end

  def given_the_user_has_visted_the_timeline
    visit root_url
  end

  def and_a_post_is_present
    expect(page).to have_selector 'li.post'
  end

  def when_the_user_deletes_a_post
    element = page.find('li.post')
    element.click_link 'delete'
  end

  def then_the_post_is_successfully_deleted
    expect(page).not_to have_selector 'li.post'
    expect(page).to have_text 'No posts to display! Speak your mind.'
  end
end
