# frozen_string_literal: true

RSpec.feature 'Submissions' do
  scenario 'Making a submission' do
    visit '/'

    fill_in 'Your name or handle', with: 'Kobayashi Issa'
    fill_in 'Your haiku', with: <<~HAIKU
      Winter seclusion -
      Listening, that evening,
      To the rain in the mountain.
    HAIKU

    click_on 'Send'

    expect(page).to have_content('Thank you')
  end
end
