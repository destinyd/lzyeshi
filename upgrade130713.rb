Picture.not_in(:commodity => nil).each{|p| p.pictureable = p.commodity; p.save}
