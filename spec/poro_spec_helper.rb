require 'pry'
require 'json'
require 'webmock/rspec'
require 'octokit'
ENV['RACK_ENV'] = 'test'
require './initializers'
require './models'

def mock_post_response
  JSON.generate({
    "name"=> "my_blog.md",
    "path"=> "my_blog.md",
    "sha"=> "1234567891234567891234567891234567891234",
    "size"=> 530,
    "url"=> "https://api.github.com/repos/bguest/blog/contents/my_post.md?ref=master",
    "html_url"=> "https://github.com/bguest/blog/blob/master/my_post.md",
    "git_url"=> "https://api.github.com/repos/bguest/blog/git/blobs/1234567891234567891234567891234567891234",
    "download_url"=> "https://raw.githubusercontent.com/bguest/blog/master/my_post.md",
    "type"=> "file",
    "content"=> "VGl0bGU6ICAgIFRoZSBUaXRsZSAgCkF1dGhvcjogICBCZW5qYW1pbiBHdWVz\ndCAgClN1YnRpdGxlOiBUaGUgZmlyc3Qgb2YgbWFueSB0aGluZ3MgdG8gY29t\nZS4gIApEYXRlOiAgICAgRmVicnVhcnkgMTMsIDIwMTQgIAoKTG9yZW0gaXBz\ndW0gZG9sb3Igc2l0IGFtZXQsIGNvbnNlY3RldHVyIGFkaXBpc2ljaW5nIGVs\naXQsIHNlZCBkbyBlaXVzbW9kIHRlbXBvciBpbmNpZGlkdW50IHV0IGxhYm9y\nZSBldCBkb2xvcmUgbWFnbmEgYWxpcXVhLiBVdCBlbmltIGFkIG1pbmltIHZl\nbmlhbSwgcXVpcyBub3N0cnVkIGV4ZXJjaXRhdGlvbiB1bGxhbWNvIGxhYm9y\naXMgbmlzaSB1dCBhbGlxdWlwIGV4IGVhIGNvbW1vZG8gY29uc2VxdWF0LiBE\ndWlzIGF1dGUgaXJ1cmUgZG9sb3IgaW4gcmVwcmVoZW5kZXJpdCBpbiB2b2x1\ncHRhdGUgdmVsaXQgZXNzZSBjaWxsdW0gZG9sb3JlIGV1IGZ1Z2lhdCBudWxs\nYSBwYXJpYXR1ci4gRXhjZXB0ZXVyIHNpbnQgb2NjYWVjYXQgY3VwaWRhdGF0\nIG5vbiBwcm9pZGVudCwgc3VudCBpbiBjdWxwYSBxdWkgb2ZmaWNpYSBkZXNl\ncnVudCBtb2xsaXQgYW5pbSBpZCBlc3QgbGFib3J1bS4KCmBgYHJ1YnkKZ2V0\nICIvIiBkbwogIEB0aXRsZSA9ICdBYm91dCBCbG9nR2l0JwogIHNsaW0gOndl\nbGNvbWUKZW5kCgpgYGAK\n"
  })
end

def mock_blog_response
  JSON.generate(
    [
      {
        "name" => "README.md",
        "path" => "README.md",
        "sha" => "de966a47add23ffeae1c4d19fbeb956c5cc67538",
        "size" => 7,
        "url" => "https://api.github.com/repos/bguest/blog/contents/README.md?ref=master",
        "html_url" => "https://github.com/bguest/blog/blob/master/README.md",
        "git_url" => "https://api.github.com/repos/bguest/blog/git/blobs/de966a47add23ffeae1c4d19fbeb956c5cc67538",
        "download_url" => "https://raw.githubusercontent.com/bguest/blog/master/README.md",
        "type" => "file",
        "_links" => {
          "self" => "https://api.github.com/repos/bguest/blog/contents/README.md?ref=master",
          "git" => "https://api.github.com/repos/bguest/blog/git/blobs/de966a47add23ffeae1c4d19fbeb956c5cc67538",
          "html" => "https://github.com/bguest/blog/blob/master/README.md"
        }
      },
      {
        "name" => "my_post.md",
        "path" => "my_post.md",
        "sha" => "1234567891234567891234567891234567891234",
        "size" => 645,
        "url" => "https://api.github.com/repos/bguest/blog/contents/my_post.md?ref=master",
        "html_url" => "https://github.com/bguest/blog/blob/master/my_post.md",
        "git_url" => "https://api.github.com/repos/bguest/blog/git/blobs/1234567891234567891234567891234567891234",
        "download_url" => "https://raw.githubusercontent.com/bguest/blog/master/my_post.md",
        "type" => "file",
        "_links" => {
          "self" => "https://api.github.com/repos/bguest/blog/contents/my_post.md?ref=master",
          "git" => "https://api.github.com/repos/bguest/blog/git/blobs/1234567891234567891234567891234567891234",
          "html" => "https://github.com/bguest/blog/blob/master/my_post.md"
        }
      }
    ]
  )
end
