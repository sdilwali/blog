class ContactMailer < ActionMailer::Base

    default to: 'sagar.dilwali@gmail.com'

    def contact_email(name,email,body)
       @name = name
       @email = email
       @body = body
       
       mail(from: email, subject: 'Contact Form Saved')
        
    end
    
end
