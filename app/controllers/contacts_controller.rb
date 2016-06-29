class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        #create contact using whitelisted params
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] =  "Contact created successfully!"
            redirect_to new_contact_path
        else
            flash[:danger] =  "Error, contact not created!"
            redirect_to new_contact_path
        end
        
    end
    
    private 
        def contact_params
            # whitelist the paramets that are allowed
            params.require(:contact).permit(:name, :email, :comments)
        end
end