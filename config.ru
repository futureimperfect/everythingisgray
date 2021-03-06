require 'bundler/setup'
require 'sinatra/base'
require 'rack-rewrite'

# The project root directory
$root = ::File.dirname(__FILE__)

use Rack::Rewrite do
  r301 /.*/,  Proc.new {|path, rack_env| "http://#{rack_env['SERVER_NAME'].gsub(/www\./i, '') }#{path}" },
      :if => Proc.new {|rack_env| rack_env['SERVER_NAME'] =~ /www\./i}
  r301 %r{^/tag/art/?$}, '/category/art/'
  r301 %r{^/tag/design/?$}, '/category/design/'
  r301 %r{^/tag/iphone/?$}, '/category/iphone/'
  r301 %r{^/tag/os-x/?$}, '/category/os-x/'
  r301 %r{^/tag/podcasting/?$}, '/category/podcasting/'
  r301 %r{^/tag/science/?$}, '/category/science/'
  r301 %r{^/tag/technology/?$}, '/category/technology/'
  r301 %r{^/tag/theme-development/?$}, '/category/theme-development/'
  r301 %r{^/tag/uncategorized/?$}, '/category/uncategorized/'
  r301 %r{^/tag/w3c/?$}, '/category/w3c/'
  r301 %r{^/tag/web-design/?$}, '/category/web-design/'
  r301 %r{^/tag/web-development/?$}, '/category/web-development/'
  r301 %r{^/tag/wordpress/?$}, '/category/wordpress/'
  r301 %r{^/[0-9]{4}/(1[0-2]|0[1-9])/(3[01]|[12][0-9]|0[1-9])/?$}, '/archives/'
  r301 %r{^/[0-9]{4}/(1[0-2]|0[1-9])/?$}, '/archives/'
  r301 %r{^/[0-9]{4}/?$}, '/archives/'
  r301 %r{^/how-to-installing-freebsd-as-a-guest-os-in-parallels-4/?$}, '/2009/04/16/how-to-installing-freebsd-as-a-guest-os-in-parallels-4/'
  r301 %r{^/2015/10/26/trumpblockr-block-donald-trump/?$}, '/2015/10/26/trumpblockr-make-web-browsing-great-again/'
  r301 %r{^/resume/?$}, '/downloads/resume.pdf'
  r301 %r{^/portfolio/?$}, 'http://everythingisgray.carbonmade.com/'
  r301 %r{^/portfolio/comics/?$}, 'http://everythingisgray.carbonmade.com/'
  r301 %r{^/contact-me/?$}, '/about/'
end

class SinatraStaticServer < Sinatra::Base

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  not_found do
    send_file(File.join(File.dirname(__FILE__), 'public', '404.html'), {:status => 404})
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run SinatraStaticServer
