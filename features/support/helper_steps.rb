Given(/^I am a registered bride and logged in$/) do
  create(:bride,
          username: 'testuser',
          password: 'password', password_confirmation: 'password',
          email: 'bride@example.com')
  visit signup_path
  within '.login_form' do
    fill_in 'username', with: 'testuser'
    fill_in 'password', with: 'password'
    click_button 'Login'
  end
end