#Created 09/06/2015
#Author GilcierWeb
#Link http://gilcierweb.com.br

class Helper

  def type_directory(type_directory)
    case (type_directory)
      when 'yes'
        puts 'Enter with directory path'
        directory_local_path = gets.to_s.strip.chomp
        puts "Directory no exists #{directory_local_path}" unless (File.exists?(directory_local_path) && File.directory?(directory_local_path))
      else
        puts "Directory default #{directory_local_path}"
    end
  end

  def type_action(type)
    case (type)
      when 'download'
        puts 'Enter with directory path'
        directory_local_path = gets.to_s.strip.chomp
        puts "Directory no exists #{directory_local_path}" unless (File.exists?(directory_local_path) && File.directory?(directory_local_path))
      else
        puts "Directory default #{directory_local_path}"
    end
  end

  def verify_extension(filename, file_extension_perm)
    file_extension = File.extname(filename)
    puts "Extension not Permission #{file_extension}" unless (file_extension == file_extension_perm)
  end

end