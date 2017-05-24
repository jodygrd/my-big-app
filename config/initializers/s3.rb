CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAIYEQOTI2V6C5TVUA',
      :aws_secret_access_key  => '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',
      :region => 'us-west-1'
  }
  config.fog_directory  = 'writ-app'
end