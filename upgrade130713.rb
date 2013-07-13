Picture.not_in(:commodity => nil).each{|p| p.pictureable = p.commodity; p.save}

Trader.all.each do |t|
  t.user.groups.create name: "#{t.user.name}的默认分组", category_list: '夜市' unless t.groups.any?
end
