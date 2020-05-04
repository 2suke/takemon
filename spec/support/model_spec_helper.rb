module ModelSpecHelper
  def image_file_path(index, file_paths)
    if index < array_length then
      Rack::Test::UploadedFile.new(File.join(Rails.root, file_paths[index]),
                                   'image/png')
    else
      ''
    end
  end
end
