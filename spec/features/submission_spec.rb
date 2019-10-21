# frozen_string_literal: true

RSpec.feature 'Submissions' do
  scenario 'Making a submission' do
    submit_haiku <<~HAIKU, by: 'Kobayashi Issa'
      Winter seclusion -
      Listening, that evening,
      To the rain in the mountain.
    HAIKU

    expect(page).to have_content('Thank you')
  end

  scenario 'Making an anonymous submission' do
    submit_haiku <<~HAIKU
      Attack ships on fire
      C-beams glitter in the dark
      Lost time, like tears in rain
    HAIKU

    expect(page).to have_content('Thank you')
  end
end
