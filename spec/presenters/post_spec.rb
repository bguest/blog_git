require 'poro_spec_helper'
require 'ostruct'

describe Presenter::Post do

  let(:presenter){Presenter::Post.new(Post.new(login:'a_user', path:'my_post'))}

  describe '#link' do
    it 'should return link for post' do
      expected = "<a href='/a_user/my_post.md'>my_text</a>"
      expect(presenter.link('my_text')).to eq expected
    end
  end

  describe '#name' do
    it 'should titleize name' do
      expect(presenter.name).to eq 'My Post'
    end
  end

end
