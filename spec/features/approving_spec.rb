# frozen_string_literal: true

RSpec.feature 'Approving' do
  let(:admin) do
    Admin.create!(email: 'admin@example.com', password: 'Password1')
  end
  let!(:pending_submission) { Submission.create(body: 'Pending haiku') }
  let!(:approved_submission) do
    Submission.approved.create!(body: 'Approved haiku')
  end

  context 'Authenticated as admin' do
    before do
      page.driver.browser.basic_authorize(admin.email, admin.password)
    end

    scenario 'Approving a pending haiku' do
      visit admin_index_path

      expect(page).to have_content('Pending haiku')
      expect(page).not_to have_content('Approved haiku')

      click_button 'Approve'

      expect(page).not_to have_content('Pending haiku')
    end
  end

  context 'Not authenticated as admin' do
    scenario 'Access is denied' do
      visit admin_index_path
      expect(page).to have_content('Access denied')
    end
  end
end
