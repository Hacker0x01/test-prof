# frozen_string_literal: true

require "test_prof/utils/json_builder"

module TestProf::FactoryProf
  module Printers
    module Json # :nodoc: all
      OUTPUT_NAME = "factory-prof.json"

      class << self
        include TestProf::Logging

        def dump(result)
          return log(:info, "No factories detected") if result.raw_stats == {}

          path = TestProf::Utils::JSONBuilder.generate(
            data: result.raw_stats,
            output: OUTPUT_NAME
          )

          log :info, "FactoryJSON report generated: #{path}"
        end
      end
    end
  end
end
