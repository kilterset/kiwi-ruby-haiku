# frozen_string_literal: true

RSpec.feature 'Viewing' do
  scenario 'Viewing haikus' do
    submit_haiku('Haiku A', by: 'Person A')
    submit_haiku('Haiku B', by: 'Person B')
    visit submissions_path

    ['Haiku A', 'Person A', 'Haiku B', 'Person B'].each do |expected|
      expect(page).to have_content(expected)
    end
  end
end
