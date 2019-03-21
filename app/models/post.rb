class Post < ApplicationRecord
  has_attached_file :photo
  has_attached_file :document, styles: { thumbnail: "60x60#" }
  # validates_attachment :document, content_type: "application/pdf"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
