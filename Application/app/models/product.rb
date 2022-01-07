class Product < ActiveRecord::Base
    has_one_attached :image
    validates :title, presence: true
    validates :image, attached: true
    belongs_to :user
   # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    # attr_accessor :image

end
