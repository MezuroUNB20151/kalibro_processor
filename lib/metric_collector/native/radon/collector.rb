module MetricCollector
  module Native
    module Radon
      class Collector < MetricCollector::Base
        def initialize
          description = "" #FIXME - Use description from colletors_description.yml
          super("Radon", description, {}) #FIXME: the last attribute should be a call to `parse_supported_metrics
        end

        def collect_metrics(code_directory, wanted_metrics)
          runner = Runner.new(reposiory_path: code_directory)

          runner.run

          #the parser comes here
          runner.clean_output
        end

        #def parse_supported_metrics
      end
    end
  end
end
