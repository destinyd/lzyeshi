namespace :yeshi do
  desc "rebuild carrierwave for new size"
  task :recarrierwave => :environment do
    Picture.all.each do |picture| 
      begin
        picture.image.cache_stored_file!
        picture.image.retrieve_from_cache!(picture.image.cache_name)
        picture.image.recreate_versions!
        picture.save!
      rescue => e
        puts  "ERROR: Picture #{picture.id} -> #{e.to_s}"
      end
    end
  end
end
