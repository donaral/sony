Given(/^I visit main page$/) do
  visit 'http://www.sony.com/search?query='
end

And(/^I search for (.*)$/) do |term|
  page.fill_in 'query', :with => term
  click_button 'Search'
end

Then(/^Results should contain term (.*)$/) do |term|
  page.find('.bd', match: :first).find('.results-p', text: term)
end
#results appear in description rather that title of results
#Search is based on complete string AND each word separately
#/search?q=mirrorless+camera+OR+mirrorless+wildcard:camera*

Then(/^Picture thumbnail is visible for first result$/) do
  #page.find('.results-list', match: :first).page.has_css?('.media')
  page.has_css?('.results-list', match: :first)
end

Then(/^There should be no results to display$/) do
  expect(page).to_not have_selector('.results-list')
end

And(/^(\d+) results are displayed on page$/) do |arg|
  table = page.find('.gsa-results')
  table.should have_css('ul li', :count == 20)
end

Then(/^I can view more results$/) do
  click_button('Load More')
  table = page.find('.gsa-results')
  table.should have_css("ul li", :count > 20)
end

And(/^I can refine search by category$/) do |term|
  page.find('.result').find(:css, 'div[data-filter-name*="electronics"]').click
  page.find('.bd', match: :first).find('.results-p', text: term)
end

