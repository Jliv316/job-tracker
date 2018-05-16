class ContactsController < ApplicationController

 def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "Created contact: #{@contact.full_name}"
      redirect_to company_jobs_path(@company)
    else
      redirect_to company_jobs_path(@company)
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:full_name, :email, :position)
  end
end