---
layout: post
title: Tutorial for Jekyll Blog Setup
date: 2022-07-06 16:29:28 -0700
category: Technology
---

My environment is Macbook Air M1 with the latest macOS.

1. Install brew

   ```shell
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install “chruby” and the latest “Ruby”

   ```shell
   brew install chruby ruby-install
   ruby-install ruby
   ```

3. Add the latest Ruby to the environment

   ```shell
   echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
   echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
   echo "chruby ruby-3.1.2" >> ~/.zshrc
   ```

   A hidden problem exists. "ruby-3.1.2" should match the ruby version you installed in step 2.

   - Show the ruby version installed in the system.

   ```shell
   chruby
   ```

   - Relaunch Terminal and check the version of Ruby.

   ```shell
   ruby -v
   ```

4. Install Jekyll

   ```shell
   gem install jekyll bundler
   ```

5. Create blog website

   ```shell
   jekyll new blogname
   bundle add webrick
   ```

   In Ruby 3.0, the server will not start without “webrick”.

6. Start server

   ```shell
   bundle exec jekyll serve
   ```
