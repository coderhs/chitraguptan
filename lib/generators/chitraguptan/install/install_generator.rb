# frozen_string_literal: true

module Chitraguptan
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("templates", __dir__)
      desc "Setup Chitraguptan Gem"

      def create_config_file
        route "mount Chitraguptan::Engine => '/chitraguptan'"
        template "chitraguptan.rb", "config/initializers/chitraguptan.rb"
      end
    end
  end
end
