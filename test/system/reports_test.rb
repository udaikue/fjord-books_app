# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    reports(:one)

    visit root_url
    fill_in 'Eメール', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '2021年○月▲日'
    fill_in '内容', with: '今日はいい天気だった。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '2021年○月▲日'
    assert_text '今日はいい天気だった。'
  end

  test 'updating a Book' do
    visit reports_url
    first('tbody tr').click_on '編集'

    fill_in 'タイトル', with: '○月▲日の日報'
    fill_in '内容', with: 'いい天気だったが午後から雨が降った。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '○月▲日の日報'
    assert_text 'いい天気だったが午後から雨が降った。'
  end

  test 'destroying a Book' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text '○月▲日の日報'
  end
end
