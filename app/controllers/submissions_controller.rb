# frozen_string_literal: true

class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.create(submission_params)
    redirect_to new_submission_path unless @submission.persisted?
  end

  def index
    @submissions = Submission.all.order(created_at: :desc)
  end

  private

  def submission_params
    params.require(:submission).permit(:body, :submitted_by)
  end
end
