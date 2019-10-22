# frozen_string_literal: true

helpers = Module.new do
  def submit_haiku(poem = 'A haiku', by: nil)
    visit new_submission_path

    fill_in 'Name or handle (optional)', with: by if by
    fill_in 'Your haiku', with: poem
    click_on 'Send'
  end

  def approve_haiku(poem, by: nil)
    # TEMP this should eventually use admin approve view:
    submissions = Submission.where(body: poem)
    submissions = submissions.where(submitted_by: by) if by.present?

    return unless submissions.one?

    submissions.first.update!(status: Submission.statuses[:approved])
  end
end

RSpec.configure do |config|
  config.include helpers
end
