require_relative './lib/oss/deploy_site.rb'

params = {
  endpoint: "oss-cn-hongkong.aliyuncs.com",
  bucket_name: "erlim"
}

DeploySite.new(ENV['OSS_ID'], ENV["OSS_SECRET"], params).bulk_push_object