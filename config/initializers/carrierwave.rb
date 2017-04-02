CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_ACCESS_SECRET'],
    region:                'ap-northeast-1',
  }
  config.storage = :fog
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  case Rails.env
    when 'production'
      config.fog_directory = 'pro-airbnb-image-store'
      config.asset_host = 'https://pro-airbnb-image-store.s3-ap-northeast-1.amazonaws.com'
    when 'development'
      config.fog_directory = 'dev-airbnb-image-store'
      config.asset_host = 'https://dev-airbnb-image-store.s3-ap-northeast-1.amazonaws.com'
    end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
