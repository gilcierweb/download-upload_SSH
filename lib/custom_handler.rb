#!/usr/bin/ruby

#Created 09/06/2015
#Author GilcierWeb
#Link http://gilcierweb.com.br

class CustomHandler
  def on_open(uploader, file)
    puts "starting upload: #{file.local} -> #{file.remote} (#{file.size} bytes)"
  end

  def on_put(uploader, file, offset, data)
    puts "writing #{data.length} bytes to #{file.remote} starting at #{offset}"
  end

  def on_close(uploader, file)
    puts "finished with #{file.remote}"
  end

  def on_mkdir(uploader, path)
    puts "creating directory #{path}"
  end

  def on_finish(uploader)
    puts "all done!"
  end
end