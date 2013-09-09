# encoding: utf-8
require "./parser"
require "test/unit"

class TestParser < Test::Unit::TestCase

  def test_find_all_emails_sample1
    sample1 = File.open("test/sample1.html")
    results = AwesomeParser.parse(sample1)
    assert_equal(38, results.length)

    testEntry = results[17]

    assert_equal("Therese_Doyle@brown.edu", testEntry[:email])
    assert_equal("401–863–9694", testEntry[:phone])
  end

  def test_find_all_emails_sample2


    sample2 = File.open("test/sample2.html")
    results = AwesomeParser.parse(sample2)
    assert_equal(20, results.length)

    testEntry = results[10]
    assert_equal("mini.jaikumar@tufts.edu", testEntry[:email])
    assert_equal("617-627-3021", testEntry[:phone])
  end

end