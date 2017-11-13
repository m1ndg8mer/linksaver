describe 'the signin process', type: :feature do
  it 'signs me in' do
    visit new_user_session_path

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it "don't signs me in" do
    visit new_user_session_path

    fill_in 'Email', with: 'test2@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
