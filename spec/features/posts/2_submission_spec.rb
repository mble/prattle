require 'spec_helper'

feature 'Post submission' do
  scenario 'Submitting a valid post' do
    given_the_user_has_visted_the_timeline
    and_the_user_has_entered_a_valid_post
    when_they_submit_the_post
    then_the_post_is_successfully_created
  end

  scenario 'Submitting an invalid post' do
    given_the_user_has_visted_the_timeline
    and_the_user_has_entered_an_invalid_post
    when_they_submit_the_post
    then_the_post_is_not_created
  end
end

def given_the_user_has_visted_the_timeline
  visit root_url
end

def and_the_user_has_entered_a_valid_post
  form.fill_in 'post[content]', with: 'Test post'
end

def and_the_user_has_entered_an_invalid_post
  form.fill_in 'post[content]', with: FFaker::Lorem.paragraphs(5).join
end

def when_they_submit_the_post
  form.click_button 'Post'
end

def then_the_post_is_successfully_created
  expect(page).to have_selector 'li.post', count: 1
end

def then_the_post_is_not_created
  expect(page).not_to have_selector 'li.post'
  expect(page).to have_text 'No posts to display! Speak your mind.'
end

private

def form
  page.find('form.new_post')
end
