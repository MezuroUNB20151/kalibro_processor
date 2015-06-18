require 'metric_collector/native/radon/parser/base'
require 'metric_collector/native/radon/parser/cyclomatic'
require 'metric_collector/native/radon/parser/maintainability'
require 'metric_collector/native/radon/parser/raw'

module MetricCollector
  module Native
    module Radon
      module Parser
        @parsers = {"cc" => MetricCollector::Native::Radon::Parser::Cyclomatic, 
          "raw" => MetricCollector::Native::Radon::Parser::Raw, 
          "mi" => MetricCollector::Native::Radon::Parser::Maintainability}

        def parse_all(file_path, wanted_metric_configurations, processing)
          wanted_metric_configurations.each do |metric_configuration|
            code = metric_configuration.metric.code
            @parsers[code].parse(file_path, processing, metric_configuration)
          end
        end
      end
    end
  end
end