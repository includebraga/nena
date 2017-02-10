Dir[File.dirname(__FILE__) + "/seeds_files/*"].each { |file| require_relative file }

locations = Seed::locations
