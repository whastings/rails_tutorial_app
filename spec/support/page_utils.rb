
RSpec::Matchers.define(:have_error_message) do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define(:have_error_list) do
  match do |page|
    page.should have_selector('#error_explanation > ul > li', text: '* ')
  end
end

RSpec::Matchers.define(:have_success_message) do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define(:have_page_title) do |title|
  match do |page|
    page.should have_selector('title', text: full_title(title))
    page.should have_selector('h1', text: title)
  end
end