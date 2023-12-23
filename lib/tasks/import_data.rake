require 'json'

namespace :import_data do
  desc "load bill data"
  task bills: :environment do
    puts "\nLOADING BILLS...\n\n"
    Bill.destroy_all

    bill_directory = "db/data/2023-2023_Regular_Session/bill"

    Dir.each_child(bill_directory) do |bill|
      bill_file = File.open "#{bill_directory}/#{bill}"
      
      bill_json = JSON.load bill_file

      bill_data = bill_json["bill"]

      bill_id     = bill_data["bill_id"]
      bill_number = bill_data["bill_number"]
      title       = bill_data["title"]
      description = bill_data["description"]
      bill_status = bill_data["status"].to_i
      bill_type   = bill_data["bill_type_id"].to_i

      Bill.create(
        id: bill_id,
        bill_number: bill_number,
        title: title,
        description: description,
        bill_status: bill_status,
        bill_type: bill_type
      )

      bill_file.close

      puts "Imported #{bill_number}: #{title}"
    end

    puts "\nALL BILLS IMPORTED!\n"
  end

  desc "Load Legislator Data"
  task legislators: :environment do
    puts "\nLOADING LEGISLATORS...\n\n"
    Legislator.destroy_all

    legislator_directory = "db/data/2023-2023_Regular_Session/people"

    Dir.each_child(legislator_directory) do |legislator|
      legislator_file = File.open "#{legislator_directory}/#{legislator}"
      
      legislator_json = JSON.load legislator_file

      legislator_data = legislator_json["person"]

      legislator_id = legislator_data["people_id"]
      party         = legislator_data["party_id"].to_i
      title         = legislator_data["role"]
      first_name    = legislator_data["first_name"]
      middle_name   = legislator_data["middle_name"]
      last_name     = legislator_data["last_name"]
      suffix        = legislator_data["suffix"]
      nickname      = legislator_data["nickname"]
      district      = legislator_data["district"]
      chamber       = legislator_data["role_id"]

      Legislator.create(
        id: legislator_id,
        party: party,
        title: title,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        suffix: suffix,
        nickname: nickname,
        district: district,
        chamber: chamber
      )

      legislator_file.close

      puts "Imported #{title}. #{first_name} #{last_name} (#{district})"
    end

    puts "\nALL LEGISLATORS IMPORTED!\n\n"
  end
  
  desc "Load Vote Data"
  task votes: :environment do
    puts "\nLOADING VOTING DATA...\n\n"
    
    RollCall.destroy_all
    LegislatorVote.destroy_all

    legislator_directory = "db/data/2023-2023_Regular_Session/vote"

    Dir.each_child(legislator_directory) do |legislator|
      legislator_file = File.open "#{legislator_directory}/#{legislator}"
      
      legislator_json = JSON.load legislator_file

      legislator_data = legislator_json["person"]

      legislator_id = legislator_data["people_id"]
      party         = legislator_data["party_id"].to_i
      title         = legislator_data["role"]
      first_name    = legislator_data["first_name"]
      middle_name   = legislator_data["middle_name"]
      last_name     = legislator_data["last_name"]
      suffix        = legislator_data["suffix"]
      nickname      = legislator_data["nickname"]
      district      = legislator_data["district"]
      chamber       = legislator_data["role_id"]

      Legislator.create(
        id: legislator_id,
        party: party,
        title: title,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        suffix: suffix,
        nickname: nickname,
        district: district,
        chamber: chamber
      )

      legislator_file.close

      puts "Imported #{title}. #{first_name} #{last_name} (#{district})"
    end

    puts "\nALL LEGISLATORS IMPORTED!\n\n"
  end

  desc "Import all data"
  task all: [:bills, :legislators] do
    puts "\nALL DATA IMPORTED!"
  end
end