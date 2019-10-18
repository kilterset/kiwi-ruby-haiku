# frozen_string_literal: true

RSpec.describe SubmissionsController, type: :controller do
  render_views

  it 'responds to #new' do
    get :new
  end

  describe '#create' do
    it 'creates a submission' do
      submission_attrs = { body: 'Haiku', submitted_by: 'Ava' }

      expect { post :create, params: { submission: submission_attrs } }
        .to change { Submission.where(submission_attrs).exists? }.to(true)
    end
  end
end
