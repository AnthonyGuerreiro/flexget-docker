source .env

cp docker-compose.yml.v1 tmp.yml

sed -i -e "s/version/asd/g" tmp.yml
sed -i -e "s/\${trakt_user}/$trakt_user/g" tmp.yml
sed -i -e "s/\${mal_user}/$mal_user/g" tmp.yml
sed -i -e "s/\${pushbullet_token}/$pushbullet_token/g" tmp.yml
sed -i -e "s:\${download_folder}:$download_folder:g" tmp.yml

docker-compose -f tmp.yml "$@"

rm tmp.yml
