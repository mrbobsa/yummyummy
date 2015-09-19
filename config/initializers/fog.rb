CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIGWIQERSDOQWS6SQ',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'            # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'project-yumyum'                          # required
end