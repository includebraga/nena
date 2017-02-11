require 'csv'

module Seed
	def self.locations
    cities_file = File.read(Rails.public_path.join('cidades_portuguesas.csv'))
    csv         = CSV.parse(cities_file, quote_char: "|", headers: true)

    csv.each do |row|
      Location.create!(row.to_hash)
    end
	end
end
