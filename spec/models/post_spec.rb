require 'poro_spec_helper'

describe Post do

  before do
    stub_request(:get, "https://api.github.com/repos/bguest/blog/contents/my_post.md?client_id=YOUR_20_CHARACTER_ID&client_secret=YOUR_APPLICATION_SECRET_GITHUB_ID_THINGY" ).
      with(:headers => {'Accept'=>'application/vnd.github.v3+json', 'Content-Type'=>'application/json'}).
      to_return(:status => 200, :body => mock_post_response, :headers => {
         :content_type => 'application/json; charset=utf-8'
      })
  end

  let(:post){Post.new(login: 'bguest', path: 'my_post')}

  it 'should exist' do
    expect(post.kind_of? Post).to be true
  end

  describe '.new()' do
    it 'should take login and path' do
      Post.new(login: 'bguest', path: 'my_post')
    end
  end

  describe '#body' do
    it 'should return content less metadata' do
      text = "\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n```ruby\nget \"/\" do\n  @title = 'About BlogGit'\n  slim :welcome\nend\n\n```"
      expect(post.body).to eq text
    end
  end

  {
    'Title' => 'The Title', 
    'Author' => 'Benjamin Guest',
    'Subtitle' => 'The first of many things to come.'
  }.each do |key, value| 

    key = key.downcase.to_sym

    describe "##{key.downcase}" do
      it 'should return articles title' do
        expect(post.send(key)).to eq value
      end

      it 'should not explode if no title' do
        allow(post).to receive(:content).and_return('No title here')
        expect(post.send(key)).to eq('')
      end
    end
  end

  describe '#date' do
    it 'should return article date' do
      expect(post.date).to eq Date.parse('Febuary 13, 2014')
    end

    it 'should return nil if no date' do
      allow(post).to receive(:content).and_return('No title here')
      expect(post.date).to eq nil
    end
  end

end
