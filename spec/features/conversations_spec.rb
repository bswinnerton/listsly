require 'spec_helper'

feature 'Conversation view' do
  given(:email) { create :email }

  scenario 'Visits the homepage' do
    visit root_path
    expect(page).to have_content 'Lists.ly'
  end

  scenario 'Visits a conversation page' do
    #TODO: Switch on whether or not conversation has emails
    #TODO: Switch on whether email is HTML or text
    visit '/cats'
    expect(page).to have_content email.recipient.email
    expect(page).to have_content email.sender.email
    expect(page).to have_content email.text_value
  end
end
