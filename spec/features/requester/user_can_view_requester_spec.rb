require 'rails_helper'

feature 'User view client' do
  scenario 'successfully' do
    requester = create(:requester)

    visit root_path
    click_on 'Solicitantes'

    expect(page).to have_content(requester.company_name)
    expect(page).to have_content(requester.cnpj)
    expect(page).to have_content(requester.address)
    expect(page).to have_content(requester.phone)
  end
end