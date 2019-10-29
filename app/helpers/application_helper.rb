# frozen_string_literal: true

module ApplicationHelper
  def app_name
    translate :app_name
  end

  def project_repository_url
    translate :repository_url
  end
end
