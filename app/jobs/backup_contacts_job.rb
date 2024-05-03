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

      # make a database backup
      backup_db
    rescue StandardError => e
      return "Error: #{e.message}"
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
    archived = contact.archived

    # check if the contact exists in the database
    existing_contact = Contact.find_by(id: id)

    if existing_contact
      # don't update if there are no changes to the information
      if firstname == existing_contact.firstname && lastname == existing_contact.lastname && email == existing_contact.email && created == existing_contact.created_at && updated == existing_contact.updated_at && archived == existing_contact.archived
        return "No changes made"
      else
        # update the existing contact
        if existing_contact.update(firstname: firstname, lastname: lastname, email: email, created_at: created, updated_at: updated, archived: archived)
          return "Updated contact with id: #{id}"
        end
        # return "Updated contact with id: #{id}"
      end
    else
      # create a new contact
      if Contact.create(id: id, firstname: firstname, lastname: lastname, email: email, created_at: created, updated_at: updated, archived: archived)
        return "Created contact with id: #{id}"
      end
      # return "Created contact with id: #{id}"
    end
  end

  def backup_db
    # command variables
    db_password = ENV["DB_PASSWORD"]
    db_host = ENV["DB_HOST"]
    db_port = ENV["DB_PORT"]
    db_username = ENV["DB_USERNAME"]
    db_filename = "./file/backup.sql"
    db_name = ENV["DB_NAME"]

    # command to be run
    command = "PGPASSWORD='#{db_password}' pg_dump -h #{db_host} -p #{db_port} -U #{db_username} -F p -b -v -f #{db_filename} -d #{db_name} -t contacts"

    # execute the command in the command line
    system(command)
  end
end
