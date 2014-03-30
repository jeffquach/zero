include ApplicationHelper
def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit root_path
    click_link "Log in"
    fill_in "Email",    with: user.email
    fill_in "Password", with: "tingzaregood" # Have to hardcode this in when using sorcery
    click_button "Log in"
  end
end


