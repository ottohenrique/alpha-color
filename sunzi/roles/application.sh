source recipes/rbenv.sh
source recipes/keys.sh

if [ -d <%= @attributes.target %> ]; then
  pushd <%= @attributes.target %>
    git pull -r
    bin/bundle install
    bin/rake db:migrate
  popd
else
  ssh-keyscan github.com >> ~/.ssh/known_hosts
  git clone <%= @attributes.git %> <%= @attributes.target %>
  cp files/database.yml <%= @attributes.target %>/config

  pushd <%= @attributes.target %>
    bin/bundle install
    bin/rake db:setup
    bin/bundle exec unicorn -D
  popd
fi
