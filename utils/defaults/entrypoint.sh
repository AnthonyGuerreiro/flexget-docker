if [ ! -f /setup-complete ]; then
  if [ -z ${trakt_user} ]; then
    echo "trakt_user is not set"
    exit 1
  fi

  if [ -z ${mal_user} ]; then
    echo "mal_user is not set"
    exit 1
  fi

  if [ -z ${pushbullet_token} ]; then
    echo "pushbullet_token is not set"
    exit 1
  fi


  sed -i -e 's/65081/9091/g' config.yml
  sed -i -e "s:trakt_user:${trakt_user}:g" secrets.yml
  sed -i -e "s:mal_user:${mal_user}:g" secrets.yml
  sed -i -e "s:pushbullet_token:${pushbullet_token}:g" secrets.yml

  mkdir -p /downloads/video/Series/
  mkdir -p /downloads/video/Anime/
  mkdir -p /downloads/video/Movies/
  mkdir -p /downloads/downloads/Series/
  mkdir -p /downloads/downloads/Anime/
  mkdir -p /downloads/downloads/Movies/

  echo "Accessing trakt for authentication token.."
  flexget trakt auth ${trakt_user}

  touch /setup-complete
fi


if [ -f /.flexget/.config-lock ]; then
  rm -f /.flexget/.config-lock
fi

flexget daemon start
