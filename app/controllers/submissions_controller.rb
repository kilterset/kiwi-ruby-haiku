# frozen_string_literal: true

class SubmissionsController < ApplicationController
  before_action :require_admin_auth, only: :approve

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submission_params)
    redirect_to new_submission_path unless @submission.persisted?
  end

  def index
    @submissions = Submission.approved.order(created_at: :desc)
  end

  def approve
    @submission = Submission.find(params[:submission_id])

    if @submission.approved!
      flash[:notice] = 'Submission approved'
    else
      flash[:error] = 'Failed to approve submission'
    end

    redirect_to admin_index_path
  end

  private

  def submission_params
    params.require(:submission).permit(:body, :submitted_by)
  end
end
