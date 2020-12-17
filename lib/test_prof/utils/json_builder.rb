# frozen_string_literal: true

require "json"

module TestProf
  module Utils
    # Generates JSON reports
    module JSONBuilder
      class << self
        def generate(data:, output:)
          outpath = TestProf.artifact_path(output)
          File.write(outpath, data.to_json)
          outpath
        end
      end
    end
  end
end
