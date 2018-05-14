describe 'user visits the page for a specific company' do
  describe 'there is a form that allows them to enter a contact' do
    describe 'when user fills in form and submits form' do
      it 'redirects to specific company show page' do
        company = Company.create!(name: "Scranton")
        contact_name = "Jim Halpert"
        position = 'Sales Representative'
        email = 'jim.halpert@scranton.com'

        visit "/companies/#{company.id}"

        fill_in 'contact[full_name]', with: contact_name
        fill_in 'contact[position]', with: position
        fill_in 'contact[email]', with: email
        click_on 'Create Contact'

        expect(current_path).to eq(company_path(company))
        expect(page).to have_content(company)
        expect(page).to have_content(contact_name)
        expect(page).to have_content(position)
        expect(page).to have_content(email)
      end
    end
  end
end