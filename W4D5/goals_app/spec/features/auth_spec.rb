require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("Sign Up")
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'user_username', with: 'Banana'
      fill_in 'user_email', with: 'bnn@ananana.com'
      fill_in 'user_password', with: 'bananabread'
      click_on 'Sign up'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content("Banana's Profile")
    end
  end
end

feature 'logging in' do
  before(:each) do
    User.create(username: 'Banana', email: 'bnn@ananana.com', password: 'bananabread')

    visit new_session_url
    fill_in 'user_email', with: 'bnn@ananana.com'
    fill_in 'user_password', with: 'bananabread'
    click_on 'Log in'
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content("Banana's Profile")
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit goals_url
    expect(page).to_not have_content('Banana')
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    User.create(username: 'Banana', email: 'bnn@ananana.com', password: 'bananabread')

    visit new_session_url
    fill_in 'user_email', with: 'bnn@ananana.com'
    fill_in 'user_password', with: 'bananabread'
    click_on 'Log in'
    click_on 'Logout'

    expect(page).to_not have_content('Banana')
  end

end
