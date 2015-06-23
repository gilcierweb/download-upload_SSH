#!/usr/bin/ruby

#Created 09/06/2015
#Author GilcierWeb
#Link http://gilcierweb.com.br

class DownloadUploadSSH

  attr_accessor :host, :username, :password, :port, :local_directory_path, :remote_directory_path, :filename

  def initialize(host, username, password, port, local_directory_path, remote_directory_path, filename)

    @host = host
    @username = username
    @password = password
    @port = port
    @local_directory_path = local_directory_path
    @remote_directory_path = remote_directory_path
    @filename = filename

  end

  def upload_ssh

    begin

      puts '------------------------'
      puts I18n.translate 'info.server.connecting'

      Net::SSH.start(@host, @username, :password => @password, :port => @port, :verbose => :debug) do |ssh|

        puts '------------------------'
        puts I18n.translate 'info.server.entering'

        puts '------------------------'
        puts I18n.translate 'info.server.list_directory'

        puts ssh.sftp.dir.entries(remote_directory_path.to_s).map { |e| e.name }

        puts local_filename_path = "#{local_directory_path.to_s}#{filename.to_s}"

        puts remote_filename_path = "#{remote_directory_path.to_s}#{filename.to_s}"

        puts '------------------------'
        puts I18n.translate 'info.server.upload.file', filename: remote_filename_path.green

        if (ssh.sftp.upload!(local_filename_path, remote_filename_path, :progress => CustomHandler.new))

          puts '------------------------'
          puts I18n.translate 'info.server.upload.success', filename: remote_filename_path.green
          puts '------------------------'

        end

        puts I18n.translate 'info.server.done_exit'.green

        ssh.close
      end

    rescue Timeout::Error
      @error = "  Timed out"
    rescue Errno::EHOSTUNREACH
      @error = "  Host unreachable"
    rescue Errno::ECONNREFUSED
      @error = "  Connection refused"
    rescue Net::SSH::AuthenticationFailed
      @error = "  Authentication failure"
    end

    puts @error if defined?(@error)

  end

  def download_ssh

    begin

      puts '------------------------'
      puts I18n.translate 'info.server.connecting'

      Net::SSH.start(@host, @username, :password => @password, :port => @port, :verbose => :debug) do |ssh|

        puts '------------------------'
        puts I18n.translate 'info.server.entering'

        puts '------------------------'
        puts I18n.translate 'info.server.list_directory'

        puts ssh.sftp.dir.entries(local_directory_path.to_s).map { |e| e.name }

        puts local_filename_path = "#{local_directory_path.to_s}#{filename.to_s}"

        puts remote_filename_path = "#{remote_directory_path.to_s}#{filename.to_s}"

        puts '------------------------'
        puts I18n.translate 'info.server.download.file', filename: remote_filename_path.green

        #bug sftp.download
        # if (ssh.sftp.download!(remote_filename_path, local_filename_path, :progress => CustomHandler.new))
        #
        #   puts '------------------------'
        #   puts I18n.translate 'info.server.download.success', filename: remote_filename_path.green
        #   puts '------------------------'
        #
        # end

        ssh.scp.download!(remote_filename_path, local_move_path) do |ch, name, sent, total|
          puts "#{name}: #{sent}/#{total}"
        end

        puts '------------------------'
        puts I18n.translate 'info.server.download.success', filename: remote_filename_path.green
        puts '------------------------'

        puts I18n.translate 'info.server.done_exit'.green

        ssh.close

      end

    rescue Timeout::Error
      @error = "  Timed out"
    rescue Errno::EHOSTUNREACH
      @error = "  Host unreachable"
    rescue Errno::ECONNREFUSED
      @error = "  Connection refused"
    rescue Net::SSH::AuthenticationFailed
      @error = "  Authentication failure"
    end

    puts @error if defined?(@error)

  end

end
