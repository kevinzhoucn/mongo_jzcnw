# encoding: utf-8

class AvatarUploader < BaseUploader
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 调整临时文件的存放路径，默认是再 public 下面
  def cache_dir
    "/tmp/uploads"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]

  process :convert => 'png'

  version :thumb do
    process :resize_to_fill => [120, 120]
  end

  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  # # Override the filename of the uploaded files:
  # def filename
  #   if super.present?
  #     # current_path 是 Carrierwave 上传过程临时创建的一个文件，有时间标记，所以它将是唯一的      
  #     @name ||= Digest::MD5.hexdigest(current_path)
  #     "#{@name}.#{file.extension.downcase}"
  #     # "#{Time.now.strftime("%Y%m%d%H%M%S")}#{rand(1000)}.#{file.extension.downcase}"
  #   end
  # end

  # Set the filename for versioned files
  # def filename
  #   random_token = Digest::SHA2.hexdigest("#{Time.now.utc}--#{model.id.to_s}").first(20)
  #   ivar = "@#{mounted_as}_secure_token"    
  #   token = model.instance_variable_get(ivar)
  #   token ||= model.instance_variable_set(ivar, random_token)
  #   "#{model.id}_#{token}.jpg" if original_filename
  # end
  def filename
     "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  end

  protected
    def secure_token(length=16)
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
    end
end
