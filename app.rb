require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(_FILE_) + 'lib/*.rb'].each { |file| require file }
