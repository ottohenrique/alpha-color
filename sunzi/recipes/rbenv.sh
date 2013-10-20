# rbenv

if [ -d /usr/local/rbenv ]; then
  source /etc/profile.d/rbenv.sh
else
  apt-get -y install \
    build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev \
    libreadline-dev libncurses5-dev libffi-dev libxml2-dev libxslt-dev \
    libcurl4-openssl-dev libicu-dev libsqlite3-dev

  git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
  echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
  chmod +x /etc/profile.d/rbenv.sh
  source /etc/profile.d/rbenv.sh

  mkdir /usr/local/rbenv/plugins
  git clone \
    git://github.com/sstephenson/ruby-build.git \
    /usr/local/rbenv/plugins/ruby-build

  git clone \
    git://github.com/sstephenson/rbenv-vars.git \
    /usr/local/rbenv/plugins/rbenv-vars

  echo "Compiling Ruby. Grab some coffee, this will take a while..."
  rbenv install <%= @attributes.ruby %>
  rbenv global <%= @attributes.ruby %>
  rbenv rehash
  gem install bundler
fi
