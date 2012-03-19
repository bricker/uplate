Factory.define :clip do |f|
  f.sequence(:title) { |n| "Clip #{n}" }
  f.video_embed_code "some embed code"
  f.description "This is a clip."
end

Factory.define :photo do |f|
  include ActionDispatch::TestProcess
  f.caption "This is a photo."
  f.asset fixture_file_upload(File.join(Rails.root, 'features', 'support', 'test-upload.jpg'), 'image/jpeg')
end