require 'active_record'
require 'erb'

include ActiveRecord::Tasks

class Seeder
  def initialize(seed)
    @seed = seed
  end

  def load_seed
    raise "Seed file '#{@seed}' does not exist" unless File.file? @seed

    load @seed_file
  end
end

root = File.expand_path '../../', __dir__
DatabaseTasks.env = ENV['APP_ENV'] || 'development'
confg_database_file = File.join root, 'config/database.yml'
database_config = YAML.load(ERB.new(File.read(confg_database_file)).result)

DatabaseTasks.database_configuration = database_config
DatabaseTasks.db_dir = File.join root, 'db'
DatabaseTasks.fixtures_path = File.join root, 'test/fixtures'
DatabaseTasks.migrations_paths = [File.join(root, 'db/migrate')]
DatabaseTasks.seed_loader = Seeder.new File.join root, 'db/seeds.rb'
DatabaseTasks.root = root

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load 'active_record/railties/databases.rake'
