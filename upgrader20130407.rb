@trader = Trader.asc(:created_at).first
@user = User.asc(:created_at).first
@groups = Group.scoped
@groups.each do |group|
  group.update_attribute :commodities_count,group.commodities.count
  group.update_attribute :trader_id,@trader.id
  group.update_attribute :user_id,@user.id
end

@traders = Trader.scoped
@traders.each do |trader|
  trader.update_attribute :commodities_count,trader.commodities.count
end
