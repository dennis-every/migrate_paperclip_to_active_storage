namespace :active_storage do
  desc "Ensures all files are mirrored"
  task mirror_all: [:environment] do

    # Set source
    @source = ActiveStorage::Blob.service.primary
    # Set destination
    @destination = ActiveStorage::Blob.service.mirrors.first

    # Upload each blob
    ActiveStorage::Blob.all.each do |blob|
      attachment = ActiveStorage::Attachment.find(blob.id)
      file = attachment.blob
      data = file.download
      @destination.upload(blob.key, data, checksum: blob.checksum)
    rescue StandardError
      puts 'Error ' + blob.key.to_s
    end

  end
end
