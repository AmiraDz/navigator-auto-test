valSearch = 'Atlantbh'
expAddress = 'Milana Preloga 12A'

name = 'House of Warriors'
city = 'Sarajevo'
zip = '71000'
address = 'Terezija'
houseNo = 'bb'
mob = '062776867'

describe 'smoke' do
  it 'should search for valid term' do
    fill_in id:'ember564', with: valSearch
    find(class:'iconav-search').click
    expect(page).to have_content(expAddress)
  end

  it 'should correctly fill out and submit form' do
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
    end
    find_button('Kreiraj').click
    expect(page).to have_button(text:'Predloži izmjene')
  end
end
