class Artifact < ActiveRecord::Base
  attr_accessor :upload
  belongs_to :project

  validates :name, presence: true, uniqueness: true
  validates :upload, presence: true
  validate :uploaded_file_size

  MAX_FILESIZE = 10.megabytes


  private

    def uploaded_file_size
      return unless upload
      return unless upload.size <= MAX_FILESIZE

      errors.add(:upload, "File size must be less than #{MAX_FILESIZE}")
    end

end
