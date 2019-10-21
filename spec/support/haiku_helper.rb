# frozen_string_literal: true

helpers = Module.new do
  def submit_haiku(poem = 'A haiku', by: nil)
    visit new_submission_path

    fill_in 'Name or handle (optional)', with: by if by
    fill_in 'Your haiku', with: poem
    click_on 'Send'
  end
end

RSpec.configure do |config|
  config.include helpers
end
