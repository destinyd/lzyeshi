# coding: utf-8
# 基本 Model，加入一些通用功能
module Mongoid
  module BaseModel
    extend ActiveSupport::Concern

    included do
      scope :recent, desc(:_id)
      #scope :exclude_ids, lambda { |ids| where(:_id.nin => ids.map(&:to_i)) }
      scope :by_week, where(:created_at.gte => 7.days.ago.utc)
      
      #delegate :url_helpers, to: 'Rails.application.routes' 
    end
  end
end
