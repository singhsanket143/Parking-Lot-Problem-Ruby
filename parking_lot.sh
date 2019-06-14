chmod +x main.rb

if [ -z "$1" ]
  then
    ruby main.rb
  else
    ruby main.rb "$PWD/$1"
fi
