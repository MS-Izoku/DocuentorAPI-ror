PASSWORD_REQUIREMENTS = /\A
(?=.{8,})           # min 8 characters
(?=.*/d)            # one number requirement
(?=.*[a-z])         # at least one lower-case letter
(?=.*[A-Z])         # at least one upper-case letter
(?=.*[[:^alnum:]])  # at least one symbol
/x

class User < ApplicationRecord
    has_secure_password
    has_many :projects
    has_many :collaberations

    validates :username, uniqueness: true, pressence: true

    validates: :password ,
     format: PASSWORD_REQUIREMENTS ,    #constant declared above
     pressence: true ,
     confirmation: true

    # valid_email_2/email is from the included Gem, also checks if the email is a throwaway
    validates :email, 
        'valid_email_2/email': { mx: true, disposable: true, disallow_subaddressing: true},
         confirmation: {case_sensative: false},
         uniqueness: true ,
         pressence: true
end
