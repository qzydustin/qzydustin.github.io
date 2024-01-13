---
title: Step-by-Step Jekyll Blog Setup Guide
date: 2022-07-06 16:29:28 -0700
category: Technology
---

Jekyll, an elegant and efficient static site generator, serves as an ideal platform for bloggers and developers looking for simplicity and power in their web projects. In this guide, I’ll take you through the process of setting up a Jekyll blog on a Macbook Air M1, leveraging the latest macOS environment. My aim is to provide a clear and concise path to get your Jekyll blog up and running, ensuring a smooth and straightforward experience. Let’s get started on this exciting journey of blogging with Jekyll on a powerful yet user-friendly setup!

### 1. Install brew

First, you need to install Homebrew, a package manager for macOS. This tool simplifies the installation of software on Apple's macOS operating system. Run the following command in your terminal:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install “chruby” and the latest “Ruby”

Next, install “chruby” and “ruby-install” using Homebrew. These tools help manage Ruby versions on your system.

```shell
brew install chruby ruby-install
ruby-install ruby
```

### 3. Add the latest Ruby to the environment

Configure your shell to automatically use the installed Ruby version.

```shell
echo "\n# Ruby" >> ~/.zshrc
echo "if [ -d \"/opt/homebrew/opt/ruby/bin\" ]; then" >> ~/.zshrc
echo "  export PATH=\"/opt/homebrew/opt/ruby/bin:\$PATH\"" >> ~/.zshrc
echo "  export PATH=\"\$(gem environment gemdir)/bin:\$PATH\"" >> ~/.zshrc
echo "fi" >> ~/.zshrc
```

**Note:** Ensure "ruby-3.1.2" matches the version you installed. Use `chruby` to check installed Ruby versions and `ruby -v` to verify the active version after restarting your terminal.

### 4. Install Jekyll

Jekyll is a static site generator that transforms your plain text into static websites and blogs.

```shell
gem install jekyll bundler
```

### 5. Create blog website

Create your new blog with Jekyll and add "webrick" to your bundle. Webrick is a Ruby library providing an HTTP server, required for Jekyll in Ruby 3.0 and later.

```shell
jekyll new blogname
bundle add webrick
```

### 6. Start server

Finally, start your Jekyll server. This command will build your site and make it available on a local server.

```shell
bundle exec jekyll serve
```

With these steps, you're all set to embark on your blogging journey with Jekyll. Happy blogging!
