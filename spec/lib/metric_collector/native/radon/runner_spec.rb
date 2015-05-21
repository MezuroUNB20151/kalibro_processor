require 'rails_helper'
require 'metric_collector'

describe MetricCollector::Native::Radon::Runner, type: :model do
  let(:repository_path) { Dir.pwd }
  subject(:radon) { MetricCollector::Native::Radon::Runner.new(repository_path: repository_path) }

  describe 'json_path' do
    it 'is expected to have an json_path' do
     expect(radon.json_path).to_not be_nil
   end

    it 'is expected to generate a file that does not exist' do
      expect(File.exists?(radon.json_path)).to be_falsey
    end
  end

  describe 'run' do
    it 'is expected to have a temp .json file in the repository path' do
      #refactor this test
      radon.run
      expect(File.exists?(radon.json_path)).to be_truthy
      radon.clean_output
    end
  end
end
