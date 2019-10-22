# frozen_string_literal: true

class Submission < ApplicationRecord
  validates :body, presence: true

  enum status: {
    pending: 'pending',
    approved: 'approved',
    denied: 'denied'
  }
end
