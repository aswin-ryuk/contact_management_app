class Api::V1::ContactsController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    begin
    	JSON.parse(request.body.read)
	    
	    @contact = Contact.new(permit_contact_params)

	    if @contact.save
	      render json: @contact, status: :created
	    else
	      render json: @contact.errors, status: :unprocessable_entity
	    end
	  rescue StandardError => e
      render json: { status: 'error', message: "An error occurred: #{e.message}" }, status: :internal_server_error
    end 
  end

  def update
  	begin
  		JSON.parse(request.body.read)

	    @contact = Contact.find(params[:id])

	    if @contact.update(permit_contact_params)
	      render json: @contact
	    else
	      render json: @contact.errors, status: :unprocessable_entity
	    end
	  rescue StandardError => e
      render json: { status: 'error', message: "An error occurred: #{e.message}" }, status: :internal_server_error
    end 
  end

  def index
		@contacts = Contact.paginate :per_page => PER_PAGE, :page => params[:page]
  end

  private

  def permit_contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :address)
  end

end



