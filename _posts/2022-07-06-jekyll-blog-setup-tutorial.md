---
layout: post
title: Jekyll Blog Setup Tutorial
date: 2022-07-06 16:29:28 -0700
category: Technology-Tutorial
---

My environment is Macbook Air M1 with latest macOS.

1. Install brew

   ```shell
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install chruby and the latest Ruby

   ```shell
   brew install chruby ruby-install
   ruby-install ruby
   ```

3. Add latest Ruby to environment

   ```shell
   echo "source $(brew --prefix)/opt/chruby/share/chruby/chruby.sh" >> ~/.zshrc
   echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" >> ~/.zshrc
   echo "chruby ruby-3.1.2" >> ~/.zshrc
   ```

   There is a hide problem. "ruby-3.1.2" should match the ruby verison you installed in step 2.

   - Show the ruby version which installed in the system.

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

   In Ruby 3.0, the server will not start normally without webrick.

6. Start server

   ```shell
   bundle exec jekyll serve
   ```
