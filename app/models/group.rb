class Group
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  taggable_on :categories
  field :name, type: String
  field :price, type: Money
  field :reserve, type: Integer
  field :text, type: String, default: ''
  field :commodities_count, type: Integer, default: 0
  belongs_to :user
  belongs_to :trader

  has_many :commodities, dependent: :destroy
  has_many :pictures, dependent: :destroy

  attr_accessor :pictures_ids, :commodity_name, :is_custom_code
  attr_accessible :name, :price, :reserve,  :pictures_ids, :text, :category_list, :commodity_name, :is_custom_code

  validates :name, presence: true, length: 2..64

  scope :available,where(:commodities_count.gt => 0)
  scope :with_commodities,includes(:commodities)
  scope :recent, desc(:created_at)

  def humanize_price
    price.to_s
  end

  def to_s
    self.name.to_s
  end

  def as_json(options={})
    #if !options.nil? and options[:action] == :show
      #options[:include] ||= {
        #commodities: {
          #except: [:created_at, :categories, :text, :price],
          #methods: [:humanize_price],
          #include: [:picture]
        #}
      #}
      #options[:except] ||= [:created_at, :categories, :text, :price, :updated_at, :reserve]
      #options[:methods] ||= [:humanize_price]
      #super(options)
    #else
      options[:methods].nil? ? (options[:methods] = [:category_list]) : options[:methods].push(:category_list)
      options[:except] = [:created_at, :categories, :text, :price, :updated_at, :reserve] unless options[:except]
      super(options)
    #end
  end

  def bulk_add
    if self.commodity_name.blank? or self.commodity_name.length < 2 or self.commodity_name.length > 64
      errors.add :commodity_name, :invalid
      return false
    end

    if pictures_ids.blank?
      errors.add :commodity_name, :need_least_one_picture
      return false
    end
    self.pictures << Picture.find(self.pictures_ids.split(','))
    self.pictures.each do |p|
      commodity = self.trader.commodities.create name: self.commodity_name, price: self.price, reserve: self.reserve, text: self.text, category_list: self.category_list
      commodity.picture = p
      commodity.name += commodity.id if is_custom_code == "1"
      self.commodities << commodity
    end
    self.save
  end

  protected
  before_create :give_trader

  def give_trader
    self.trader = self.try(:user).try(:trader)
  end
end
