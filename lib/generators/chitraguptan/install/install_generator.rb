# frozen_string_literal: true

require "rails/generators/migration"

module Chitraguptan
  module Generators
    # InstallGenerator
    # This is the install generator for Sail
    # which creates the necessary migrations
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("templates", __dir__)
      desc "Create Chitraguptan migrations"

      def self.next_migration_number(_path)
        if @prev_migration_nr
          @prev_migration_nr += 1
        else
          @prev_migration_nr = Time.now.strftime("%Y%m%d%H%M%S").to_i
        end

        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "create_chitraguptan_variables.rb",
                           "db/migrate/create_chitraguptan_variables.rb",
                           migration_version: migration_version
      end

      def create_config_file
        route "mount Chitraguptan::Engine => '/chitraguptan'"
        template "chitraguptan.rb", "config/initializers/chitraguptan.rb"
      end

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
      end
    end
  end
end
