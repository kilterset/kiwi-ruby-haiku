# frozen_string_literal: true

RSpec.describe SubmissionsController, type: :controller do
  render_views

  it 'responds to #new' do
    expect(get(:new).status).to eq 200
  end

  it 'responds to #index' do
    expect(get(:index).status).to eq 200
  end

  describe '#create' do
    it 'creates a submission' do
      submission_attrs = { body: 'Haiku', submitted_by: 'Ava' }

      expect { post :create, params: { submission: submission_attrs } }
        .to change { Submission.where(submission_attrs).exists? }.to(true)
    end
  end

  describe '#approve' do
    let!(:pending_submission) { Submission.create!(body: 'Pending submission') }
    let(:params) { { submission_id: pending_submission.id } }

    context 'with admin authentication' do
      let(:admin) do
        Admin.create!(email: 'admin@example.com', password: 'Password1')
      end

      before do
        http_login(username: admin.email, password: admin.password)
      end

      it 'approves a submission' do
        expect { patch :approve, params: params }.to(
          change { pending_submission.reload.status }
            .from(Submission.statuses[:pending])
            .to(Submission.statuses[:approved])
        )
      end
    end

    context 'not authenticated' do
      it 'does not approve submission' do
        expect { patch :approve, params: params }
          .not_to(change { pending_submission.status })
      end
    end
  end
end
