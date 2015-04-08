class User < ActiveRecord::Base

has_many :posts, :dependent => :destroy

validates :first_name, :presence => true, :length => { :maximum => 25 }
validates :last_name, :presence => true, :length => { :maximum => 50}
#validates :email, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX,:confirmation => true

has_secure_password

end
