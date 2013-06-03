$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
name = "shoulda_reuse_setup"
require "#{name.gsub("-","/")}/version"

Gem::Specification.new name, ShouldaReuseSetup::VERSION do |s|
  s.summary = "Reuse the setup of a test context"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "http://github.com/grosser/#{name}"
  s.files = `git ls-files lib/ bin/`.split("\n")
  s.license = "MIT"
  cert = File.expand_path("~/.ssh/gem-private_key.pem")
  if File.exist?(cert)
    s.signing_key = cert
    s.cert_chain = ["gem-public_cert.pem"]
  end
end
