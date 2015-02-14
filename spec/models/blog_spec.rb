require 'poro_spec_helper'

describe Blog do

  before do
    stub_request(:get, "https://api.github.com/repos/bguest/blog/contents/?client_id=YOUR_20_CHARACTER_ID&client_secret=YOUR_APPLICATION_SECRET_GITHUB_ID_THINGY" ).
      with(:headers => {'Accept'=>'application/vnd.github.v3+json', 'Content-Type'=>'application/json'}).
      to_return(:status => 200, :body => mock_blog_response, :headers => {
         :content_type => 'application/json; charset=utf-8'
      })
  end

  let(:blog){Blog.new(login: 'bguest')}

  describe 'attributes' do
    subject{Blog.new(login: 'bguest')}
    it{ should be_a Blog }
  end

  describe '#post_names' do
    it 'should return an array of post names' do
      expect(blog.post_names).to eq(%w(README my_post))
    end
  end

  describe '#posts' do
    it 'should return an array of Posts for blog' do
      posts = blog.posts
      expect(posts[0].is_a? Post).to be true
      expect(posts[1].is_a? Post).to be true
      expect(posts[0].path).to eq('README')
      expect(posts[1].path).to eq('my_post')
    end 
  end

end
