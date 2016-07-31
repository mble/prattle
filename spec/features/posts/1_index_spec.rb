require 'spec_helper'

feature 'Post Timeline' do
  before do
    create_list :post, 5
  end

  scenario 'Visiting the timeline' do
    when_a_user_visits_the_timeline
    then_they_should_be_presented_with_a_sumission_form
    and_a_list_of_posts
  end

  def when_a_user_visits_the_timeline
    visit root_url
  end

  def then_they_should_be_presented_with_a_sumission_form
    expect(page).to have_selector 'form.new_post'
    expect(page).to have_button 'Post'
  end

  def and_a_list_of_posts
    expect(page).to have_selector 'div.row.posts-timeline'
    expect(page).to have_selector 'li.post', count: 5
  end
end
