# frozen_string_literal: true

RSpec.feature 'Viewing' do
  scenario 'Viewing approved haikus' do
    submit_haiku('Haiku A', by: 'Person A')
    approve_last_pending_haiku

    submit_haiku('Haiku B', by: 'Person B')

    submit_haiku('Haiku C', by: 'Person C')
    approve_last_pending_haiku

    visit submissions_path

    ['Haiku A', 'Person A', 'Haiku C', 'Person C'].each do |expected|
      expect(page).to have_content(expected)
    end

    expect(page).not_to have_content('Haiku B')
    expect(page).not_to have_content('Person B')
  end
end
