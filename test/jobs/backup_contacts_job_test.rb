require "test_helper"
require 'hubspot-api-client'

ACCESS_TOKEN = ENV["HUBSPOT_ACCESS_TOKEN"]

class BackupContactsJobTest < ActiveJob::TestCase
  def setup
    client = Hubspot::Client.new(access_token: ACCESS_TOKEN)
    client.crm.contacts.basic_api.get_all
    Contact.destroy_all
  end

  # test "the truth" do
  #   assert true
  # end
  
  test "process_contact should create contact record if not existing" do

    contact = Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:1,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"bh@hubspot.com",
          "firstname"=>"Brian",
          "lastname"=>"Halligan (Sample Contact)"
        }
      }
    )

    worker = BackupContactsJob.new
    msg = worker.process_contact(contact)
    
    assert_equal "Created contact with id: 1", msg
  end

  test "process_contact should update contact record if existing changed" do

    # create a contact and process it
    contact = Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:1,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"bh@hubspot.com",
          "firstname"=>"Brian",
          "lastname"=>"Halligan (Sample Contact)"
        }
      }
    )
    worker = BackupContactsJob.new
    worker.process_contact(contact)

    # make a new contact with the same id but different info
    new_contact = Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:1,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"bh@hubspot.com",
          "firstname"=>"Briannew",
          "lastname"=>"Halligannew (Sample Contact)"
        }
      }
    )

    # process the new contact and check that the record was updated
    msg = worker.process_contact(contact)
    
    assert_equal "Updated contact with id: 1", msg
  end

  test "process_contact should not update contact record if existing not changed" do
    
    # create a contact and process it
    contact = Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:1,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"bh@hubspot.com",
          "firstname"=>"Brian",
          "lastname"=>"Halligan (Sample Contact)"
        },
        archived: false
      }
    )
    worker = BackupContactsJob.new
    worker.process_contact(contact)

    new_contact = Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:1,
        created_at:"2024-04-29T02:33:19.568Z".in_time_zone("UTC"),
        updated_at:"2024-04-29T15:30:29.311Z".in_time_zone("UTC"),
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z".in_time_zone("UTC"),
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z".in_time_zone("UTC"),
          "email"=>"bh@hubspot.com",
          "firstname"=>"Brian",
          "lastname"=>"Halligan (Sample Contact)"
        },
        archived: false
      }
    )

    # process the contact again and check that the record didn't change
    msg = worker.process_contact(new_contact)
    
    assert_equal "No changes made", msg
  end

  test "delete_contacts should delete records that aren't in a given list of ids" do

    # create multiple contacts and process it
    contacts = []
    contacts << Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:1,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"bh@hubspot.com",
          "firstname"=>"Brian",
          "lastname"=>"Halligan (Sample Contact)"
        },
        archived: false
      }
    )
    contacts << Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:2,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"jd@hubspot.com",
          "firstname"=>"John",
          "lastname"=>"Doe (Sample Contact)"
        },
        archived: false
      }
    )

    # process the contacts
    worker = BackupContactsJob.new
    worker.process_contacts(contacts)

    # make an array of a single id
    ids = [1]

    # delete the contacts that aren't in the list
    msg = worker.delete_contacts(ids)

    # test the output and the number of records in the Contact table
    assert_equal "Deleted contacts", msg
    assert_equal 1, Contact.count
  end

  test "delete_contacts should not delete records if list of ids contain all ids in table" do

    # create multiple contacts and process it
    contacts = []
    contacts << Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:1,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"bh@hubspot.com",
          "firstname"=>"Brian",
          "lastname"=>"Halligan (Sample Contact)"
        },
        archived: false
      }
    )
    contacts << Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
      {
        id:2,
        created_at:"2024-04-29T02:33:19.568Z",
        updated_at:"2024-04-29T15:30:29.311Z",
        properties: {
          "createdate"=>"2024-04-29T02:33:19.568Z",
          "lastmodifieddate"=>"2024-04-29T15:30:29.311Z",
          "email"=>"jd@hubspot.com",
          "firstname"=>"John",
          "lastname"=>"Doe (Sample Contact)"
        },
        archived: false
      }
    )

    # process the contacts
    worker = BackupContactsJob.new
    ids = worker.process_contacts(contacts)

    # delete the contacts that aren't in the list
    msg = worker.delete_contacts(ids)

    # test the output and the number of records in the Contact table
    assert_equal 2, Contact.count
    assert_equal "No contacts deleted", msg
  end

end
