

class User < ApplicationRecord
    has_secure_password
    has_many :projects
    has_many :collaberations

    has_many :documents , through: :projects

    has_many :books , through: :projects
    has_many :chapters , through: :books

    validates :username , presence: true, uniqueness: {case_sensitive: false}

   validates :password , format: {with: /^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})/ , multiline: true} , confirmation: true

    # valid_email_2/email is from the included Gem, also checks if the email is a throwaway
    validates :email, 
        'valid_email_2/email': { mx: true, disposable: true, disallow_subaddressing: true},
         uniqueness: true ,
         presence: true
end
