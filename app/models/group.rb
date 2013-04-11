class Group
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::TaggableOn
  taggable_on :categories
  field :name, type: String
  field :price, type: Money
  field :reserve, type: Integer
  field :text, type: String, default: ''
  belongs_to :user

  has_many :commodities, dependent: :destroy
  has_many :pictures, dependent: :destroy

  attr_accessor :pictures_ids
  attr_accessible :name, :price, :reserve,  :pictures_ids, :text, :category_list

  after_create :admin_create_group, if: :is_admin_group?

  def admin_create_group
     self.pictures << Picture.find(self.pictures_ids.split(','))
    self.pictures.each do |p|
      commodity = self.user.commodities.create name: self.name, price: self.price, reserve: self.reserve, text: self.text, category_list: self.category_list
      commodity.picture = p
      self.commodities << commodity
    end
    self.save
  end

  def is_admin_group?
    self.user and self.user.has_role :admin
  end

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

end
