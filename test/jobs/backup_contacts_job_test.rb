require "test_helper"
require 'hubspot-api-client'

ACCESS_TOKEN = ENV["HUBSPOT_ACCESS_TOKEN"]


# need to migrate to minitest
class BackupContactsJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "process_contact should create contact record if not existing" do
    client = Hubspot::Client.new(access_token: ACCESS_TOKEN)

    client.crm.contacts.basic_api.get_all

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
    client = Hubspot::Client.new(access_token: ACCESS_TOKEN)

    client.crm.contacts.basic_api.get_all

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
          "firstname"=>"Briannew",
          "lastname"=>"Halligannew (Sample Contact)"
        }
      }
    )

    # process the new contact and check that the record was updated
    msg = worker.process_contact(contact)
    
    assert_equal "Updated contact with id: 1", msg

  end


  # TBD test not working properly, function works fine after manual testing
  test "process_contact should update contact record if existing not changed" do
    client = Hubspot::Client.new(access_token: ACCESS_TOKEN)

    client.crm.contacts.basic_api.get_all

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
    puts worker.process_contact(contact)

    new_contact = Hubspot::Crm::Contacts::SimplePublicObjectWithAssociations.new(
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

    # process the contact again and check that the record didn't change
    msg = worker.process_contact(contact)
    
    assert_equal "No changes made", msg
  end
end
