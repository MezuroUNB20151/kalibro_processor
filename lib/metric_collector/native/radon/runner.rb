module MetricCollector
  module Native
    module Radon
      class Runner
        def initialize(attributes={repository_path: nil})
          @repository_path = attributes[:repository_path]
          @json_path = generate_output_path
        end

        def run
          Dir.chdir(@repository_path) { `radon raw -j . > #{json_path}` }
        end

        def json_path
          @json_path
        end

        def clean_output
          File.delete(json_path) if File.exists?(json_path)
        end

        private

        def generate_output_path
          file_path = @repository_path

          while File.exists?(file_path)
            file_path = "#{@repository_path}/#{Digest::MD5.hexdigest(Time.now.to_s)}.json"
          end

          file_path
        end
      end
    end
  end
end
