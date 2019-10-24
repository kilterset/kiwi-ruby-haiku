# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :require_admin_auth

  def index
    @submissions = Submission.pending.order(created_at: :desc)
  end
end
