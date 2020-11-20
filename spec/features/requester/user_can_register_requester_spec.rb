require 'rails_helper'

feature 'User register an requester' do
  scenario 'Successfully' do

    visit root_path
    click_on 'Solicitantes'
    click_on 'Registrar Novo'
    fill_in 'Razão social', with: 'Shelby Company'
    fill_in 'CNPJ', with: '4564560564564/0001-52'
    fill_in 'Endereço', with: 'Birmghan, England'
    fill_in 'Telefone', with: '(42) 4242-4242'
    click_on 'Salvar'

    expect(page).to have_content('Shelby Company')
    expect(page).to have_content('4564560564564/0001-52')
    expect(page).to have_content('Birmghan, England')
    expect(page).to have_content('(42) 4242-4242')
  end

  scenario 'company name and cnpj must be uniq' do
    requester = create(:requester, cnpj: '4564560564564/0001-52')
    requester = create(:requester, company_name: 'Shelby Company')

    visit root_path
    click_on 'Solicitantes'
    click_on 'Registrar Novo'
    fill_in 'Razão social', with: 'Shelby Company'
    fill_in 'CNPJ', with: '4564560564564/0001-52'
    fill_in 'Endereço', with: 'Birmghan, England'
    fill_in 'Telefone', with: '(42) 4242-4242'
    click_on 'Salvar'

    expect(page).to have_content('Company name has already been taken')
    expect(page).to have_content('Cnpj has already been taken')
  end
  scenario 'and must fill all fields' do

    visit root_path
    click_on 'Solicitantes'
    click_on 'Registrar Novo'
    fill_in 'Razão social', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Telefone', with: ''
    click_on 'Salvar'

    expect(page).to have_content("Company name can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("Cnpj can't be blank")
    expect(page).to have_content("Phone can't be blank")
  end
end