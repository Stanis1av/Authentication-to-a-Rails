#==| STEP 2. Creating an initializer to configure Sendinblue API key |=====
#==| The API-key will be hidden with Figaro |=====
SibApiV3Sdk.configure do |config|
  config.api_key['api-key'] = ENV["send_in_blue_api_key"]
end
