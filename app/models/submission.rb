# frozen_string_literal: true

class Submission < ApplicationRecord
  validates :body, presence: true
end
