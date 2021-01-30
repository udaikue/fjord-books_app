# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    my_report = Report.create!(user_id: me.id, title: 'My Report', content: 'これは私の日報です。')
    assert my_report.editable?(me)

    her_report = Report.create!(user_id: she.id, title: 'Her Report', content: 'これは彼女の日報です。')
    assert_not her_report.editable?(me)
  end

  test '#created_on' do
    report = Report.create!(user_id: users(:test).id, title: 'test', content: 'This is test.')

    assert_not_instance_of(Date, report)
    assert_instance_of(Date, report.created_on)
  end
end
