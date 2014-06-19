class DigesterController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:email]

  def email
  end
end
