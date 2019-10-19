# frozen_string_literal: true

RSpec.describe 'Remembering who sent a submission', :js do
  specify 'submitter is remembered' do
    submit_haiku by: 'Memoranda'
    visit new_submission_path

    expect(find_field('submission[submitted_by]').value).to eq 'Memoranda'
  end
end
