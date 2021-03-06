When(/^I call the available\? method for svn$/) do
  @availability = Downloaders::SvnDownloader.available?
end

When(/^I call retrieve! from svn with "(.*?)" and "(.*?)"$/) do |address, directory|
  Downloaders::SvnDownloader.retrieve!(address, directory, nil)
end

Then(/^"(.*?)" should be a svn repository$/) do |directory|
  expect(Dir.exists?("#{directory}/.svn")).to be_truthy
end
