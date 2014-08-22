require 'rails_helper'

describe Processor::Downloader do
  describe 'methods' do
    describe 'task' do
      let(:configuration) { FactoryGirl.build(:configuration) }
      let!(:code_dir) { "/tmp/test" }
      let!(:repository) { FactoryGirl.build(:repository, scm_type: "GIT", configuration: configuration, code_directory: code_dir) }
      let!(:processing) { FactoryGirl.build(:processing, repository: repository) }
      let!(:runner) { Runner.new(repository, processing) }

      context 'successfully downloading' do

        before :each do
          Downloaders::GitDownloader.expects(:retrieve!).with(repository.address, code_dir).returns true
        end

        it 'is expected to download' do
          Processor::Downloader.task(runner)
        end
      end

      context 'with error when downloading' do
        before :each do
          Downloaders::GitDownloader.expects(:retrieve!).with(repository.address, code_dir).raises(Git::GitExecuteError)
        end

        it 'is expected to raise a processing error' do
          expect {Processor::Downloader.task(runner)}.to raise_error(Errors::ProcessingError)
        end
      end
    end

    describe 'state' do
      it 'is expected to return "DOWNLOADING"' do
        expect(Processor::Downloader.state).to eq("DOWNLOADING")
      end
    end
  end
end
