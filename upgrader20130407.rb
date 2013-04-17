@groups = Group.scoped
@groups.each do |group|
  group.update_attribute :commodities_count,group.commodities.count
end

@trader = Trader.scoped
@traders.each do |trader|
  trader.update_attribute :commodities_count,trader.commodities.count
end
