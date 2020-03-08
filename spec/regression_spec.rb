valSearch = 'Atlantbh'
expAddress = 'Milana Preloga 12A'

invSearch = 'Hurricane'

name = 'House of Warriors'
city = 'Sarajevo'
zip = '71000'
address = 'Terezija'
houseNo = 'bb'
mob = '062776867'



describe 'regression' do
  it 'should search for valid term' do
    fill_in id:'ember564', with: valSearch
    find(class:'iconav-search').click
    expect(page).to have_content(expAddress)
  end

  it 'should display message for invalid term' do
    fill_in id:'ember564', with: invSearch
    find(class:'iconav-search').click
    expect(page).to have_content('Žao nam je. Nismo uspjeli pronaći niti jedan rezultat za traženu pretragu.')
  end

  it 'should fill out and submit form w valid data' do
    find(id:'ember572').click
    within('.expanded .nav-lefthand-form-container') do
      fill_in 'poi_name', with: name
      fill_in 'poi_city_name', with: city
      fill_in 'poi_zip_code', with: zip
      fill_in 'poi_place_id', with: address
      fill_in 'poi_house_number', with: houseNo
      click_button(text:'Odaberite kategoriju')
      find('.category-selector-view .row select').first(:option,'Sport').select_option
      fill_in 'poi_mobile_phone', with: mob
      find_button(text:'Kreiraj').click
    end
    expect(page).to have_button(text:'Predloži izmjene')
  end

  it 'should not submit form w/o required fields' do
    find(id:'ember572').click
    within('.expanded .nav-lefthand-form-container') do
      fill_in 'poi_city_name', with: city
      fill_in 'poi_zip_code', with: zip
      fill_in 'poi_house_number', with: houseNo
      click_button(text:'Odaberite kategoriju')
      find('.category-selector-view .row select').first(:option,'Sport').select_option
      fill_in 'poi_mobile_phone', with: mob
      find_button(text:'Kreiraj').click
    end
    expect(page).to have_content('Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo')
  end

  it 'should open about page' do
    click_on(id:'ember633')
    expect(page).to have_content('Novi koncept i vizuelni identitet')
  end

  it 'should redirect to fb' do
    find(class:'iconav-facebook').click
    expect(page).to have_content('Navigator.ba')
  end

  it 'should display list of items in category' do
    find(class:'food').click
    expect(page).to have_content('ocjena')
  end

end
