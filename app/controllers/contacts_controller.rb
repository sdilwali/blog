class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        #create contact using whitelisted params
        @contact = Contact.new(contact_params)
        
        if @contact.save
            
            # #get values from param to setup the email
            # name = params[:contact][:name]
            # email = params[:contact][:email]
            # body = params[:contact][:comments]
            
            # # send the email
            # ContactMailer.contact_email(name, email, body).deliver
            
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