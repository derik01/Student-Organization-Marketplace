require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
    def with_scope(locator)
        locator ? within(locator) { yield } : yield
    end
end
World(WithinHelpers)

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
end

When /^I press "([^\"]*)"$/ do |link|
    click_link(link)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
    visit path_to(page_name)
end

And /^(?:|I )should see "([^\"]*)"$/ do |button__text|
    page.should have_content(button__text)
end

Then /^I sign up with "(.*?)" username and "(.*?)" password$/ do |user, password|
    # find("#user_username").set(user_name)
    fill_in('user_username', with: user)
    fill_in('user_password', with: password)
    click_button("Create Account")
end