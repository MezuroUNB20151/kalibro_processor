module MetricCollector
  module Native
    module Radon
      module Parser
        class Base
          def parse(collected_metrics_hash); raise NotImplementedError; end
        end
      end
    end
  end
end 