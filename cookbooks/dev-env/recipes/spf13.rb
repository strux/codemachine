bash "install spf13 ultimate vim" do
  user = search('users').first['id']
  code 'sh <(curl https://j.mp/spf13-vim3 -L)'
end
