class ContactsController < ApplicationController
  
  # index to retrieve all contacts
  def index
    @contacts = Contact.all
  end

  # backup method to retrieve from the api and backup contacts
  def backup
    BackupContactsJob.perform_now
    redirect_to root_path
  end
end
