CarrierWave.configure do |config|

  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'aaa',                        # required
    aws_secret_access_key: 'bbb',                        # required
    region:                'ap-northeast-1',                  # optional, defaults to 'us-east-1'

    endpoint:              'https://s3-ap-northeast-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'name_of_directory'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = {} # optional, defaults to {}
end