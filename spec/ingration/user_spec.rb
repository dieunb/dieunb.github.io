# frozen_string_literal: true

require 'spec_helper'

Capybara.app = Rack::Builder.new do
  eval( # rubocop:disable Security/Eval
    File.read(File.expand_path('./config.ru'))
  )
end

describe 'users#index', type: :feature do
  before do
    User.create name: 'Justin', email: 'user@example.com'

    visit '/users'
  end

  it 'renders index view' do
    expect(page).to have_content('User list')
  end

  it 'shows a list of users' do
    expect(
      page
    ).to have_selector(
      'li',
      text: /Justin/,
      count: 1
    )
  end
end
