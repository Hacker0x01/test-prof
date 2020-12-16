# frozen_string_literal: true

require "test_prof/utils/html_builder"

module TestProf::FactoryProf
  module Printers
    module Flamegraph # :nodoc: all
      OUTPUT_NAME = "factory-prof.json"

      class << self
        include TestProf::Logging

        def dump(result)
          return log(:info, "No factories detected") if result.raw_stats == {}
          # report = {}

          # report[:total_count] = result.stats.sum { |stat| stat[:total_count] }
          # total_top_level_count = result.stats.sum { |stat| stat[:top_level_count] }
          # total_time = result.stats.sum { |stat| stat[:top_level_time] }
          # total_uniq_factories = result.stats.map { |stat| stat[:name] }.uniq.count

          # msgs <<
          #   <<~MSG
          #     Factories usage

               # Total: #{total_count}
               # Total top-level: #{total_top_level_count}
               # Total time: #{format("%.4f", total_time)}s
               # Total uniq factories: #{total_uniq_factories}

               #   total   top-level     total time      time per call      top-level time               name
            # MSG

          # result.stats.each do |stat|
          #   time_per_call = stat[:total_time] / stat[:total_count]

          #   msgs << format("%8d %11d %13.4fs %17.4fs %18.4fs %18s", stat[:total_count], stat[:top_level_count], stat[:total_time], time_per_call, stat[:top_level_time], stat[:name])
          # end

          path = TestProf::Utils::JSONBuilder.generate(
            data: result,
            output: OUTPUT_NAME
          )

          log :info, "FactoryJSON report generated: #{path}"
        end
      end
    end
  end
end
