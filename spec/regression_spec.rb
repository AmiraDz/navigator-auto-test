valSearch = 'Atlantbh'
expAddress = 'Milana Preloga 12A'

invSearch = 'Hurricane'

name = 'House of Warriors'
city = 'Sarajevo'
zip = '71000'
address = 'Terezija'
houseNo = 'bb'
mob = '062776867'
comm = 'najjače'

pName = 'Test Name'
pEmail = 'ime123@bht.ba'
pComment = 'pravo dobra stranica'
pMob = '062123456'
pMsg = 'Poruka uspješno poslana. Navigator tim će Vas kontaktirati u roku od 48 sati.'

sSearch = 'dos hermanos'
sCity = '5555'
sAddress = '6666'
sDescrip = 'Divna hrana, divan ambijent'
sComm = 'Ostavlja bez daha'
sMsg = 'Zahvaljujemo Vam na predloženim izmjenama. Vaše izmjene će biti vidljive nakon revizije.'

invName = '1234'
invEmail = '2345'
invMob = '3456'

describe 'regression' do
  #1 search-positive
  it 'should search for valid term' do
    fill_in id:'ember564', with: valSearch
    find(class:'iconav-search').click
    expect(page).to have_content(expAddress)
  end
  #2 search-negative
  it 'should display message for invalid term' do
    fill_in id:'ember564', with: invSearch
    find(class:'iconav-search').click
    expect(page).to have_content('Žao nam je. Nismo uspjeli pronaći niti jedan rezultat za traženu pretragu.')
  end
  #3 createplace-positive
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
      fill_in 'poi_comment', with: comm
      find_button(text:'Kreiraj').click
    end
    expect(page).to have_button(text:'Predloži izmjene')
  end
  #4 createplace-negative
  it 'should not submit form w/o required fields' do
    find(id:'ember572').click
    within('.expanded .nav-lefthand-form-container') do
      fill_in 'poi_city_name', with: city
      fill_in 'poi_zip_code', with: zip
      fill_in 'poi_house_number', with: houseNo
      click_button(text:'Odaberite kategoriju')
      find('.category-selector-view .row select').first(:option,'Sport').select_option
      fill_in 'poi_mobile_phone', with: mob
      fill_in 'poi_comment', with: comm
      find_button(text:'Kreiraj').click
    end
    expect(page).to have_content('Forma sadrži nevalidne podatke. Molimo ispravite i pokušajte ponovo')
  end
  #5 about-page
  it 'should open about page' do
    click_on(id:'ember633')
    expect(page).to have_content('Novi koncept i vizuelni identitet')
  end
  #6 language-test
  it 'should switch language to english and back to bosnian' do
    within('ul.languages') do
      find(class:'en').click
    end
    expect(page).to have_content('Suggest features - Report a problem')
    within('ul.languages') do
      find(class:'bs').click
    end
    expect(page).to have_content('Predloži ideju - Pošalji komentar')
  end
  #7 fb-redirect
  it 'should redirect to fb' do
    find(class:'iconav-facebook').click
    expect(page).to have_content('Navigator.ba')
  end
  #8 category-list
  it 'should display list of items in category' do
    find(class:'food').click
    expect(page).to have_content('ocjena')
  end
  #9 category-result
  it 'should open category list and pick a result' do
    find(class:'food').click
    find(class:'name',match: :first).click
    expect(page).to have_content('Predloži izmjene')
  end
  #10 map-zoomin
  it 'should zoom in the map' do
    find_link('+').click
    expect(page).to have_content('O Navigatoru')
  end
  #11 map-movement
  it 'should move the map' do
    find(class:'leaflet-map-pane').send_keys :arrow_down
    sleep(5)
  end
  #12 map-pins
  it 'should click map pin' do
    fill_in id:'ember564', with: sSearch
    find(class:'iconav-search').click
    find(class:'.map-marker-icon, .highlighted-map-marker-icon, .place-form-marker-icon').click
    sleep(5)
  end
  #13 place-ratings

  #15 place-photos
  #16 suggest-changes-positive
  it 'should suggest changes to place' do
    fill_in id:'ember564', with: sSearch
    find(class:'iconav-search').click
    find(class:'name').click
    find_button('Predloži izmjene').click
    fill_in 'poi_description', with: sDescrip
    fill_in 'poi_comment', with: sComm
    find_button('Predloži izmjene').click
    expect(page).to have_content(sMsg)
  end
  #17 suggest-changes-negative
  it 'should not suggest changes to place w invalid data' do
    fill_in id:'ember564', with: sSearch
    find(class:'iconav-search').click
    find(class:'name').click
    find_button('Predloži izmjene').click
    fill_in 'poi_city_name', with: sCity
    fill_in 'poi_place_id', with: sAddress
    fill_in 'poi_comment', with: sComm
    find_button('Predloži izmjene').click
    expect(page).not_to have_content(sMsg)
  end
  #18 claim-form-positive
  it 'should claim place w valid data' do
    fill_in id:'ember564', with: sSearch
    find(class:'iconav-search').click
    find(class:'name').click
    find_button('Vaš objekat?').click
    fill_in 'Vaše ime', with: pName
    fill_in 'Vaš email', with: pEmail
    fill_in 'Vaš telefon', with: pMob
    find_button('Pošalji').click
    expect(page).to have_content(pMsg)
  end
  #19 claim-form-negative
  it 'should not claim place w invalid data' do
    fill_in id:'ember564', with: sSearch
    find(class:'iconav-search').click
    find(class:'name').click
    find_button('Vaš objekat?').click
    fill_in 'Vaše ime', with: invName
    fill_in 'Vaš email', with: invEmail
    fill_in 'Vaš telefon', with: invMob
    find_button('Pošalji').click
    expect(page).to have_content('Pošalji')
  end
  #20 suggest-features-form
  it 'should suggest feature-send comment' do
    click_on(id:'ember587')
    fill_in 'name_surname', with: pName
    fill_in 'email', with: pEmail
    fill_in 'comment', with: pComment
    find_button(value:'Pošalji').click
    expect(page).to have_content('Hvala na poruci! Potrudit ćemo se da što prije reagujemo.')
  end
end
