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

    rescue StandardError => e
      puts "Error: #{e.message}"
    end
  end
end
