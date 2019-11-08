require 'pg'

feature 'Chitter' do 
    scenario 'Redirects to login from index view' do 
        visit('/')
        expect(page).to have_content "Log in"
    end

    scenario 'Log in user' do
        User.create('rob@rob.com', "rob")
        visit('/login')
        fill_in('email', :with => "rob@rob.com")
        fill_in('password', with: 'rob')
        click_button "Log in"
        expect(page).to have_content "rob@rob.com"
    end

    scenario 'Log in fails with invalid user' do
        User.create('rob@rob.com', "rob")
        visit('/login')
        fill_in('email', :with => "rob@rob.com")
        fill_in('password', with: 'ronjeremy')
        click_button "Log in"
        expect(page).to have_content "Log in"
    end
end