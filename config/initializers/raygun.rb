if defined? Raygun
  Raygun.setup do |config|
    config.api_key = ENV['RAYGUN_API_KEY']
    config.api_key = "DfwruDRPzafETQ5ACGFJzg=="
    config.filter_parameters = Rails.application.config.filter_parameters
  end
end
