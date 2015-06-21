#!/usr/bin/ruby

require 'open-uri'
require 'fileutils'

require 'net/ssh'
require 'net/sftp'
require 'net/scp'

require 'i18n'

require 'colorize'

require File.expand_path('lib/custom_handler')
require File.expand_path('lib/download_upload_SSH')

# Use
I18n.load_path = Dir['./i18n/*.yml']

I18n.enforce_available_locales = false
I18n.available_locales = ["pt-BR"]
puts I18n.default_locale = :'pt-BR'

puts I18n.translate 'enter.whats.language'
language = gets.to_s.strip.downcase.chomp

language = (!language.to_s.empty? && language == 'en') ? language : 'pt-BR'

I18n.locale = :"#{language}"

puts I18n.translate 'enter.whats.host'
server = gets.to_s.strip.chomp
uri = URI.parse('sftp://' + server)

puts I18n.translate 'enter.whats.username'
user = gets.to_s.strip.chomp

puts I18n.translate 'enter.whats.password'
pass = gets.to_s.strip.chomp

puts I18n.translate 'enter.whats.port'
port = gets.to_s.strip.chomp

puts I18n.translate 'enter.whats.local.directory'
local_directory_path = gets.to_s.strip.chomp
puts I18n.translate "info.directory.no_exists", local: local_directory_path.red unless (File.exists?(local_directory_path) && File.directory?(local_directory_path))

puts I18n.translate 'enter.whats.remote.directory'
remote_directory_path = gets.to_s.strip.chomp
puts I18n.translate "info.directory.no_exists", local: remote_directory_path.red unless (File.exists?(remote_directory_path) && File.directory?(remote_directory_path))

puts I18n.translate 'enter.whats.filename'
filename = gets.to_s.strip.chomp

puts I18n.translate 'enter.whats.type.action'
type = gets.to_s.strip.downcase.chomp

download_upload_SSH = DownloadUploadSSH.new(uri.host, user, pass, port, local_directory_path, remote_directory_path, filename)

case (type)

  when 'download'
    puts I18n.translate 'enter.whats.type.download'
    download_upload_SSH.download_ssh
  else
    puts I18n.translate 'enter.whats.type.upload'
    download_upload_SSH.upload_ssh
end