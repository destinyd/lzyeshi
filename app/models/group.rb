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

  attr_accessor :pictures_ids
  attr_accessible :name, :price, :reserve,  :pictures_ids, :text, :category_list

  scope :available,where(:commodities_count.gt => 0)
  scope :with_commodities,includes(:commodities)

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
      options[:except] ||= [:created_at, :categories, :text, :price, :updated_at, :reserve]
      super(options)
    #end
  end

  protected
  before_create :give_trader

  def give_trader
    self.trader = self.try(:user).try(:trader)
  end

  after_create :admin_create_group#, if: :is_admin_group?

  def admin_create_group
    if is_admin_group?
      unless pictures_ids.blank?
        self.pictures << Picture.find(self.pictures_ids.split(','))
        self.pictures.each do |p|
          commodity = self.trader.commodities.create name: self.name, price: self.price, reserve: self.reserve, text: self.text, category_list: self.category_list
          commodity.picture = p
          self.commodities << commodity
        end
        self.save
      end
    end
  end

  def is_admin_group?
    self.user and self.user.has_role? :admin
  end
end
