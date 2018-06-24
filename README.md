# README

- Create a public repo
- Create a issues webhook
- Run npm i -g ngrok
- Run ngrok http 3000
- Get ngrok url and set it to your webhook
- Run bundle install
- Run rails db:migrate
- Run rails s

Now any change to your repo issues will be sent to your API ;)
