require 'rails_helper'

feature 'User create a new loan' do
  scenario 'successfully' do
    requester = create(:requester)

    visit root_path
    click_on 'Solicitantes'
    click_on requester.company_name
    click_on 'Solicitar emprestimo'
    fill_in 'Valor do emprestimo', with: '100000'
    fill_in 'Taxa ao mês', with: '1.5'
    fill_in 'Parcelas', with: '12'
    click_on 'Salvar'

    expect(page).to have_content(requester.company_name)
    expect(page).to have_content('R$ 9.168,00')
  end
  scenario 'and cant put letters on this form' do
    requester = create(:requester)

    visit root_path
    click_on 'Solicitantes'
    click_on requester.company_name
    click_on 'Solicitar emprestimo'
    fill_in 'Valor do emprestimo', with: 'dsadsa'
    fill_in 'Taxa ao mês', with: 'dsa'
    fill_in 'Parcelas', with: 'dsadsa'
    click_on 'Salvar'

    expect(page).to have_content('Value is not a number')
    expect(page).to have_content('Fee is not a number')
    expect(page).to have_content('Month is not a number')
  end
end