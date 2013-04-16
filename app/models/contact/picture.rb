class Contact::Picture < Contact::Base
  mount_uploader :value, ContactUploader
end
