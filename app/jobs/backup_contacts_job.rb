require 'hubspot-api-client'

ACCESS_TOKEN = ENV["HUBSPOT_ACCESS_TOKEN"]

class BackupContactsJob < ApplicationJob
  queue_as :default

  def perform
    begin
      # make a client object
      client = Hubspot::Client.new(access_token: ACCESS_TOKEN)

      # get all contacts from HubSpot's API
      response = client.crm.contacts.basic_api.get_all

      # convert the response to an array
      contacts = response.to_a
      # puts contacts

      # process the contacts
      process_contacts(contacts)

      # return ""
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end

  # process contacts methods
  def process_contacts(contacts)
    contacts.each do |contact|
      # process the contact
      process_contact(contact)
    end
    # puts "Processed contacts"
    return "Processed contacts"
  end

  def process_contact(contact)
    # retrieve the id, firstname, lastname, email, created and updated dates
    id = contact.id
    firstname = contact.properties["firstname"]
    lastname = contact.properties["lastname"]
    email = contact.properties["email"]
    created = contact.created_at
    updated = contact.updated_at

    # check if the contact exists in the database
    existing_contact = Contact.find_by(id: id)

    if existing_contact
      # update the existing contact
      existing_contact.update(firstname: firstname, lastname: lastname, email: email, created_at: created, updated_at: updated)
      # puts "Updated contact with id: #{id}"
      return "Updated contact with id: #{id}"
    else
      # create a new contact
      Contact.create(id: id, firstname: firstname, lastname: lastname, email: email, created_at: created, updated_at: updated)
      # puts "Created contact with id: #{id}"
      return "Created contact with id: #{id}"
    end
  end
end
