describe 'the signup process', type: :feature do
  it 'signs me up' do
    visit new_user_registration_path

    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  it "don't signs me up" do
    visit new_user_registration_path

    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'
    click_button 'Sign up'
    expect(page).to have_content 'Password is too short'
  end

  it "don't signs me up" do
    visit new_user_registration_path

    fill_in 'Email', with: Faker::Internet.email
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '1234567'
    click_button 'Sign up'
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end

  it "don't signs me up" do
    visit new_user_registration_path

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content 'Email is already taken'
  end

  it "don't signs me up" do
    visit new_user_registration_path

    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'
    expect(page).to have_content 'Email can\'t be blank'
  end
end
