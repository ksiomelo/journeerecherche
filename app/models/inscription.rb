class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Inscription < ActiveRecord::Base
  scope :visible, where('status != ?', 8)
  scope :approved, where(:approved => true)
  scope :waiting, where(:approved => false)
  #default_scope where(:approved => true)



  # VALID_CONTENT_TYPES = ["application/zip", "application/x-zip", "application/x-zip-compressed", "application/pdf", "application/x-pdf"]
# 
  # before_validation(:on => :create) do |file|
  # if file.media_content_type == 'application/octet-stream'
    # mime_type = MIME::Types.type_for(file.media_file_name)    
    # file.media_content_type = mime_type.first.content_type if mime_type.first
  # end
# end
# 
  # def attachment_content_type
  # errors.add(:media, "type is not allowed") unless VALID_CONTENT_TYPES.include?(self.media_content_type)
  # end

  self.per_page = 20
  
  #validates_attachment_presence :cv
  
  has_attached_file :avatar, :styles => { :medium => "100x100>", :thumb => "32x32>" }
  has_attached_file :cv
  validates_attachment_size :cv, :less_than=>2.megabyte, :if => Proc.new { |imports| !imports.cv_file_name.blank? }
  validates_attachment_size :avatar, :less_than=>1.megabyte, :if => Proc.new { |imports| !imports.avatar_file_name.blank? }
  
  validates_attachment_content_type :avatar, :content_type=>['image/jpeg', 'image/png', 'image/gif'], :if => Proc.new { |imports| !imports.avatar_file_name.blank? }
  validates_attachment_content_type :cv, :content_type=>['application/pdf', 'text/plain', 'application/msword', 'application/zip', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'], :if => Proc.new { |imports| !imports.cv_file_name.blank? }

  
  validates :first_name, :last_name, :status, :presence => true
  validates :email, :email => true, :presence => true
  validates :areas, :length => { :minimum => 1 }
  
  has_many :favorites, :dependent => :destroy
  has_many :users, :through => :favorites
  
  has_and_belongs_to_many :areas
  
  def professor?
    return status == 7
  end
  
end
