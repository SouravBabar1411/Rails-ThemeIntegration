require 'test_helper'

class AnnouceMailerTest < ActionMailer::TestCase
  test "annoucement_created" do
    mail = AnnouceMailer.annoucement_created
    assert_equal "Annoucement created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
