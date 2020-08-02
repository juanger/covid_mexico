require "application_system_test_case"

class MunicipalitiesTest < ApplicationSystemTestCase
  setup do
    @municipality = municipalities(:one)
  end

  test "visiting the index" do
    visit municipalities_url
    assert_selector "h1", text: "Municipalities"
  end

  test "creating a Municipality" do
    visit municipalities_url
    click_on "New Municipality"

    fill_in "Code", with: @municipality.code
    fill_in "Id", with: @municipality.id
    fill_in "Name", with: @municipality.name
    fill_in "State", with: @municipality.state_id
    click_on "Create Municipality"

    assert_text "Municipality was successfully created"
    click_on "Back"
  end

  test "updating a Municipality" do
    visit municipalities_url
    click_on "Edit", match: :first

    fill_in "Code", with: @municipality.code
    fill_in "Id", with: @municipality.id
    fill_in "Name", with: @municipality.name
    fill_in "State", with: @municipality.state_id
    click_on "Update Municipality"

    assert_text "Municipality was successfully updated"
    click_on "Back"
  end

  test "destroying a Municipality" do
    visit municipalities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Municipality was successfully destroyed"
  end
end
