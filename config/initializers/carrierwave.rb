CarrierWave.configure do |config|
  config.asset_host = proc do |file|
    identifier = rand(0..6)
    "http://images#{identifier}.ysdev.realityandapp.com"
  end
end
