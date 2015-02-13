require 'poro_spec_helper'

describe Post do

  before do
    stub_request(:get, "").
      with(:headers => {'Accept'=>'application/vnd.github.v3+json', 'Content-Type'=>'application/json'}).
      to_return(:status => 200, :body => mock_post_response, :headers => {
         :content_type => 'application/json; charset=utf-8'
      })
  end

  it 'should exist' do
    expect(Post.new(login: 'bguest', path: 'my_post').kind_of? Post).to be true
  end

  describe '.new()' do
    it 'should take login and path' do
      Post.new(login: 'bguest', path: 'my_post')
    end
  end

  describe '#title' do
    it 'should return articles title' do
    end
  end
end
