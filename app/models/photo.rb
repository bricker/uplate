class Photo < ActiveRecord::Base
  # HEROKU
  production = Rails.env == 'production'
  asset_path = production ? ":attachment" : "#{Rails.root}/public/:attachment/#{Rails.env}"
  has_attached_file :asset,
                    styles: { display: "800x800", thumb: "200x200" },
                    storage: production ? :s3 : :filesystem,
                    s3_credentials: { access_key_id: AppConfig["s3_key"], secret_access_key: AppConfig["s3_secret"] },
                    path: "#{asset_path}/:id/:style/:basename.:extension",
                    bucket: 'uplate'
  
  validates_attachment_presence :asset, if: 'new_record?'
  validates_attachment_content_type :asset, content_type: %r{(?:image)(?:\/.+)?}, message: "Only images are allowed.", if: 'new_record?'
end
