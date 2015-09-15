```console
git clone git@github.com:AlphaGit/platypus.git
cd platypus
vagrant up
vagrant ssh

# in vagrant
cd /platypus
bundle install
rake db:create
rake db:migrate

rails s&
rails c

# in rails command
User.create(:email => "admin@test.com", :password => "12345678").save
```