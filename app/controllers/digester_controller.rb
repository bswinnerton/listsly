class DigesterController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:email]

  def email
    if params[:mandrill_events]
      DigestionWorker.perform_async(params[:mandrill_events])
      render nothing: true, status: 200
    else
      render nothing: true, status: 404
    end
  end
end
