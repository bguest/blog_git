Title: Welcome To BlogItHub  
Subtitle: The Super Simple Blog for Programers  
Comments: false  

#TL;DR

1. Create Github Repo called blog, and make sure it has a `README.md`

2. Add your first post to the repository

        git clone git@github.com:<github user>/blog.git
        echo 'That was easy' > my_first_post.md
        git add .; git commit -m 'My First Post'; git push

3. Go see your new blog.

      `open http://www.blogithub.com/<github user>/my_first_post`

# About

www.blogithub.com is a thin html/css layer around a blog in your repository
called blog. You write articles in [markdown][1] and push your changes up to
github, and blogithub take care of getting getting these posts through the
GitHub API and making them look pretty.

## Tech

blogithub uses [Sinatra][4] and [Pure.css][5]. I choose these because I wanted to
keep things simple. [Disqus][3] is used for comments.

# MetaData

At the top of a blog post (and README), you can specify certain bits of
metadata. This metadata is used to configure and add elements to your blog post.

You can add a block like the following to add style and to your post.

```markdown
Title:    My Title          # Appears at top of blog post
Subtitle: A Longer subtitle # Appears below the post
Author:   My Name           # If you have more than one author for the blog
Comments: true | false      # Used to turn comments on and off for blog post
```

The block of metadata must occur at the top of the file with nothing above it.
Metadata tags in the body of the text will not be identified as metadata

# The Readme

The README.md for your blog repo is used for the intro to your blog and will be
viewable at `http://www.blogithub.com/<your github user name>`

# Fork-Me

The code for blogithub is located [here][2] feel free to fork and make pull
requests, but take in to account that my vision is that people shouldn't have to
worry about forking or running their own servers if they want to customize
things, there should be a way to simply specify the style & css they want to
use.

[1]:https://help.github.com/articles/markdown-basics/
[2]:http://github.com/bguest/blog_git:
[3]:https://disqus.com/
[4]:http://www.sinatrarb.com/
[5]:http://purecss.io/
