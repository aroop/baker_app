require 'dragonfly'
app = Dragonfly[:images]

app.configure_with(:imagemagick)
app.configure_with(:rails)

if Rails.env == "production"
  app.datastore = Dragonfly::DataStorage::S3DataStore.new
  app.datastore.configure do |c|
    c.bucket_name       = ENV['S3_BUCKET']
    c.access_key_id     = ENV['S3_KEY']
    c.secret_access_key = ENV['S3_SECRET']
    c.region            = ENV['S3_REGION']
  end
end

app.define_macro(ActiveRecord::Base, :image_accessor)
app.define_macro(ActiveRecord::Base, :file_accessor)
app.cache_duration = 3600*24*365 # cache assets for 365 days