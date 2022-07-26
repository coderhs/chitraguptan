module Chitraguptan
  class Variable < ApplicationRecord
    self.table_name = 'chitraguptan_variables'

    validates :key, :value, presence: true

    def key_value
      begin
        JSON.parse(value)['value'] if value
      rescue
        # avoid error during booting
      end
    end
  end
end
