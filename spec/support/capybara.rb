# frozen_string_literal: true

require 'capybara/rails'

Capybara.server = :puma, { Silent: true }
