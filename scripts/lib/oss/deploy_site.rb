require_relative './deploy.rb'

class DeploySite < Deploy
  def local_objects
    files = []
    Find.find('_site/blog') { |path| files << path if File.file?(path) }
    files << "_site/sitemap.xml"
    files << "_site/feed.xml"
    files.compact
  end

  def push_object(path)
    if path.start_with?('_site')
      remote_path = path.sub('_site/', '')
    else
      remote_path = path
    end
    bucket.put_object(remote_path, file: path)

    check_push_status(path)
  end
end