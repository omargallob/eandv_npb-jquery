class UploadJob < Struct.new(:upload_id)
  def perform
    Upload.find(self.upload_id).perform
  end
end