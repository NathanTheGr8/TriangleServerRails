class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable


    has_attached_file :avatar, :styles => {
        :md => "300x300#",
        :thumb => "100x100#"
    },
    :default_url => "avatar/:style/missing.png"
    #:bucket =>'davisrecipebook',
    #:storage => :s3,
    #:s3_credentials => "#{Rails.root}/config/s3.yml"
    #:s3_credentials => Proc.new{|a| a.instance.s3_credentials }
    #:storage => :dropbox,
    #:dropbox_credentials => Rails.root.join("config/dropbox.yml")

    #def s3_credentials
    #  {:bucket =>'davisrecipebook', :access_key_id => '', :secret_access_key => ''}
    #end

	
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates_attachment_size :avatar, :less_than => 10.megabytes

end
