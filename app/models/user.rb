

class User < ApplicationRecord
    has_secure_password
    has_many :projects
    has_many :collaberations

    validates :username , presence: true, uniqueness: true

   validates :password , format: {with: /^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})/ , multiline: true} , confirmation: true

    # # valid_email_2/email is from the included Gem, also checks if the email is a throwaway
    # validates :email, 
    #     'valid_email_2/email': { mx: true, disposable: true, disallow_subaddressing: true},
    #      confirmation: {case_sensative: false},
    #      uniqueness: true ,
    #      presence: true


    
end
