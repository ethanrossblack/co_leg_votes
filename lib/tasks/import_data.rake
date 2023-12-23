require 'json'

namespace :import_data do
  desc "load bill data"
  task bills: :environment do
    puts "Loading Bills..."
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

    puts "\nAll bill imported!\n"
  end
end