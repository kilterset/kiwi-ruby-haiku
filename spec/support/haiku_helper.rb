# frozen_string_literal: true

helpers = Module.new do
  def submit_haiku(poem = 'A haiku', by: nil)
    visit new_submission_path

    fill_in 'Name or handle (optional)', with: by if by
    fill_in 'Your haiku', with: poem
    click_on 'Send'
  end

  def approve_last_pending_haiku
    submission = Submission.order(created_at: :desc).pending.first

    raise 'No more pending haikus' unless submission.present?

    submission.approved!
  end
end

RSpec.configure do |config|
  config.include helpers
end
