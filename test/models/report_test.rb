# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    users(:bob)

    alice_report = Report.create(user_id: users(:alice).id, title: 'Aliceの日報', content: 'これはアリスの日報です。')
    assert alice_report.editable?(alice)

    bob_report = Report.create(user_id: users(:bob).id, title: 'Bobの日報', content: 'これはボブの日報です。')
    assert_not bob_report.editable?(alice)
  end

  test '#created_on' do
    report = Report.create(user_id: users(:test).id, title: 'test', content: 'This is test.')

    assert_not_instance_of(Date, report)
    assert_instance_of(Date, report.created_on)
  end
end
