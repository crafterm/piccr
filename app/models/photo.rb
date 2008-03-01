require 'base64'

class Photo < ActiveRecord::Base

  has_attachment :content_type => :image, 
                 :storage      => :file_system, 
                 :size         => 1.kilobyte .. 5.megabytes,
                 :resize_to    => '800x600>',
                 :thumbnails   => { :tiny => '120x75>', :small => '320x200>', :medium => '640x400>' }

  
  # ===============
  # = Validations =
  # ===============
  validates_as_attachment

  # ================
  # = Associations =
  # ================
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  has_many :comments
  
  # ===========
  # = Filters =
  # ===========
  after_save :tagify
  attr_accessor :tagnames
  
  def encoded=(e)
    data = Tempfile.new('photo')
    begin
      data << Base64.decode64(e)
      self.uploaded_data = data
    ensure
      data.close
    end
  end
  
  def self.per_page
    6 # for pagination
  end

  def tagnames
    self.tags.collect(&:name).join(' ')
  end
  
  def next
    Photo.find :first, :conditions => ['id < ? and thumbnail is NULL', self.id ], :order => 'created_at desc'
  end

  def previous
    Photo.find :first, :conditions => ['id > ? and thumbnail is NULL', self.id ], :order => 'created_at'
  end
  
  def self.fullsize_images(page = 1, conditions = {})
    self.paginate(:page => page, 
                  :conditions => { :parent_id => nil  }.update(conditions), :order => 'created_at desc')
  end
  
  private
  
    def tagify
      return if @tagnames.blank?
      Tagging.delete_all ['photo_id = ?', self.id]
      
      @tagnames.split(/ /).each do |tagname|
        self.tags << Tag.find_or_create_by_name(tagname)
      end
    end
  
end
