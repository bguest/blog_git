require 'pry'
require 'json'
require 'webmock/rspec'
require 'octokit'
require './initializers'
require './models'

def mock_post_response
  JSON.generate({
    "name"=> "my_first_blog.md",
    "path"=> "my_first_blog.md",
    "sha"=> "4187918a840343d749ab672772ae6c628e0e1710",
    "size"=> 530,
    "url"=> "https://api.github.com/repos/bguest/blog/contents/my_first_blog.md?ref=master",
    "html_url"=> "https://github.com/bguest/blog/blob/master/my_first_blog.md",
    "git_url"=> "https://api.github.com/repos/bguest/blog/git/blobs/4187918a840343d749ab672772ae6c628e0e1710",
    "download_url"=> "https://raw.githubusercontent.com/bguest/blog/master/my_first_blog.md",
    "type"=> "file",
    "content"=> "VGl0bGU6ICAgIFRoZSBUaXRsZSAgCkF1dGhvcjogICBCZW5qYW1pbiBHdWVz\ndCAgClN1YnRpdGxlOiBUaGUgZmlyc3Qgb2YgbWFueSB0aGluZ3MgdG8gY29t\nZS4gIApEYXRlOiAgICAgRmVicnVhcnkgMTMsIDIwMTQgIAoKTG9yZW0gaXBz\ndW0gZG9sb3Igc2l0IGFtZXQsIGNvbnNlY3RldHVyIGFkaXBpc2ljaW5nIGVs\naXQsIHNlZCBkbyBlaXVzbW9kIHRlbXBvciBpbmNpZGlkdW50IHV0IGxhYm9y\nZSBldCBkb2xvcmUgbWFnbmEgYWxpcXVhLiBVdCBlbmltIGFkIG1pbmltIHZl\nbmlhbSwgcXVpcyBub3N0cnVkIGV4ZXJjaXRhdGlvbiB1bGxhbWNvIGxhYm9y\naXMgbmlzaSB1dCBhbGlxdWlwIGV4IGVhIGNvbW1vZG8gY29uc2VxdWF0LiBE\ndWlzIGF1dGUgaXJ1cmUgZG9sb3IgaW4gcmVwcmVoZW5kZXJpdCBpbiB2b2x1\ncHRhdGUgdmVsaXQgZXNzZSBjaWxsdW0gZG9sb3JlIGV1IGZ1Z2lhdCBudWxs\nYSBwYXJpYXR1ci4gRXhjZXB0ZXVyIHNpbnQgb2NjYWVjYXQgY3VwaWRhdGF0\nIG5vbiBwcm9pZGVudCwgc3VudCBpbiBjdWxwYSBxdWkgb2ZmaWNpYSBkZXNl\ncnVudCBtb2xsaXQgYW5pbSBpZCBlc3QgbGFib3J1bS4KCmBgYHJ1YnkKZ2V0\nICIvIiBkbwogIEB0aXRsZSA9ICdBYm91dCBCbG9nR2l0JwogIHNsaW0gOndl\nbGNvbWUKZW5kCgpgYGAK\n"
  })
end
