require 'spec_helper'

feature 'Conversation view' do
  scenario 'Visits the homepage' do
    visit root_path
    expect(page).to have_content 'Say hello' # when this is changed, be sure to also update the newrelic monitor
  end

  scenario 'Visits a conversation page' do
    email = create :html_email
    visit '/cats'
    expect(page).to have_content email.recipient.email
    expect(page).to have_content email.sender.email
    expect(page).to have_content ActionView::Base.full_sanitizer.sanitize(email.value)
  end
end
