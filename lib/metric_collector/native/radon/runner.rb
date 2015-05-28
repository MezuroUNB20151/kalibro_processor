module MetricCollector
  module Native
    module Radon
      class Runner
<<<<<<< HEAD
        def initialize(attributes={repository_path: nil})
          @repository_path = attributes[:repository_path]
        end

        def repository_path
          @repository_path
=======
        def initialize(attributes={repository_path: nil, chosen_metrics:["raw", "cc", "mi"]})
          @repository_path = repository_path
          @chosen_metrics = chosen_metrics
>>>>>>> 731c780bcab4e9280a562a0485a983c8a00d4490
        end

        def run
          for metric in chosen_metrics do
            collect_metric(metric)
          end
        end

        def clean_output
<<<<<<< HEAD
          File.delete('radon_cc_output.json') if File.exists?('radon_cc_output.json')
          File.delete('radon_mi_output.json') if File.exists?('radon_mi_output.json')
          File.delete('radon_raw_output.json') if File.exists?('radon_raw_output.json')
        end

        private

        def run_cyclomatic_complexity
          Dir.chdir(@repository_path) { `radon cc -s --json . > radon_cc_output.json` }
        end

        def run_maintainability
          Dir.chdir(@repository_path) { `radon mi -s --json . > radon_mi_output.json` }
        end

        def run_raw
          Dir.chdir(@repository_path) { `radon raw -s --json . > radon_raw_output.json` }
=======
          for metric in @output_paths do
            File.delete(@output_paths[metric]) if File.exists?(@output_paths[metric])
          end
        end

        def chosen_metrics
          @chosen_metrics
        end

        def generate_output_paths
          @output_paths = {}
          for metric in chosen_metrics do
            file_path = @repository_path

            while File.exists?(file_path)
              @output_paths[metric] = "#{@repository_path}/#{Digest::MD5.hexdigest(Time.now.to_s)}.json"
            end
          end
          @output_paths
>>>>>>> 731c780bcab4e9280a562a0485a983c8a00d4490
        end

        private

        def collect_metric(metric)
          Dir.chdir(@repository_path) { `radon #{metric} -s --json . > #{@output_paths[metric]}` }
        end
      end
    end
  end
end