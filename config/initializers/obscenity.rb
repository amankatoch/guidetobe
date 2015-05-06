Obscenity.configure do |config|
  config.blacklist   = ["shite", "bloody"]
  config.whitelist   = ["safe", "word"]
  config.replacement = :garbled
end