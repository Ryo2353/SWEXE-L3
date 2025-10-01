require "test_helper"

class BookmarkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "titleが空の時にsaveされない" do
    bookinfo = Bookmark.new
    bookinfo.url = "https://www.youtube.com"
    bookinfo.interest = "面白い"
    assert_not bookinfo.valid?
    assert bookinfo.errors.include?(:title)
  end
  
  test "urlが空の時にsaveされない" do
    bookinfo = Bookmark.new
    bookinfo.title = "Youtube"
    bookinfo.interest = "面白い"
    assert_not bookinfo.valid?
    assert bookinfo.errors.include?(:url)
  end
  
  test "interestが空の時にsaveされない" do
    bookinfo = Bookmark.new
    bookinfo.url = "https://www.youtube.com"
    bookinfo.title = "Youtube"
    assert_not bookinfo.valid?
    assert bookinfo.errors.include?(:interest)
  end
  
  test "urlがフォーマットにあってないの時にsaveされない" do
    bookinfo = Bookmark.new
    bookinfo.title = "Youtube"
    bookinfo.url = "htps://www.youtube.com"
    bookinfo.interest = "面白い"
    assert_not bookinfo.valid?
    assert bookinfo.errors.include?(:url)
  end
  
  test "titleが重複している時にsaveされない" do
    Bookmark.create(
      title: "重複テスト",
      url: "https://example.com",
      interest: "テスト"
    )
    bookinfo = Bookmark.new
    bookinfo.title = "重複テスト"
    bookinfo.url = "https://example.com"
    bookinfo.interest = "テスト2"
    assert_not bookinfo.valid?
    assert bookinfo.errors.include?(:title)
  end
  
  test "titleが50文字を超えている時にsaveされない" do
    bookinfo = Bookmark.new
    bookinfo.title = "a"*25 + "/" + "あ"*25
    bookinfo.url = "https://www.youtube.com"
    bookinfo.interest = "面白い"
    assert_not bookinfo.valid?
    assert bookinfo.errors.include?(:title)
  end
  
end
