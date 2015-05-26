require 'metric_collector/native/radon/parser/base'
require 'metric_collector/native/radon/parser/raw'
require 'json'

module MetricCollector
  module Native
    module Radon
      module Parser
        @parsers = {raw: MetricCollector::Native::Radon::Parser::Raw}

        def self.collected_results(json_file_path, wanted_metrics)
          file_content = File.read(json_file_path) #This is required to get the file content into a string, because the JSON.parse only reads strings.
          parsed_results = JSON.parse(json_file_path) 

          wanted_metrics.each do |metric|
            @parsers[metric].parse(parsed_results)
          end
        end
      end
    end
  end
end