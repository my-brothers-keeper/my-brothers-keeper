# frozen_string_literal: true

module Admin
  # Base class for shared admin functionality
  class BaseController < ApplicationController
    layout 'admin'
  end
end
