require 'csv'

namespace :users do
  desc "import users from giving CSV file"
  task import: :environment do
    path = File.join Rails.root, "users.csv"
    CSV.foreach(path, headers: true) do |row|
      User.create(row.to_hash)
    end
  end

  desc "export all Users from database to CSV file"
  task export: :environment do
    file = "#{Rails.root}/public/users.csv"

    table = User.all

    CSV.open( file, 'w' ) do |writer|
      writer << table.first.attributes.map { |a,v| a }
      table.each do |s|
        writer << s.attributes.map { |a,v| v }
      end
    end
  end
end
