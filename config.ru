require 'bundler/setup'
require 'sinatra/base'
require 'rack-rewrite'

# The project root directory
$root = ::File.dirname(__FILE__)

use Rack::Rewrite do
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
  r301 %r{^/[0-9]{4}/[0-9]{2}/[0-9]{2}/?$}, '/archives/'
  r301 %r{^/[0-9]{4}/[0-9]{2}/?$}, '/archives/'
  r301 %r{^/[0-9]{4}/?$}, '/archives/'
  r301 %r{^/how-to-installing-freebsd-as-a-guest-os-in-parallels-4/?$}, '/2009/04/16/how-to-installing-freebsd-as-a-guest-os-in-parallels-4/'
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
