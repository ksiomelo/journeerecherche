class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :website, :telephone, :domain, :wants_to_interview, :participants, :comments,:responsable, :lunch, :tagline
  
  has_attached_file :logo, :styles => { :medium => "128x128>", :thumb => "64x64>" }
  
 validates :name, :telephone, :participants, :responsable, :presence => true
 validates :email, :uniqueness => true
  
  validates_numericality_of :participants, :greater_than => 0, :less_than => 15
  
  has_many :favorites, :dependent => :destroy
  has_many :inscriptions, :through => :favorites
  
  scope :approved, where(:approved => true, :admin =>false)
  scope :waiting, where(:approved => false, :admin =>false)
  
  def active_for_authentication? 
  super && approved? 
end 

def inactive_message 
  if !approved? 
    :not_approved 
  else 
    super # Use whatever other message 
  end 
end

  
  
end
