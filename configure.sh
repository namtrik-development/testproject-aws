sudo mv ./gunicorn.service /etc/systemd/system/gunicorn.service
sudo systemctl enable gunicorn
sudo systemctl start gunicorn

sudo rm /etc/nginx/sites-enabled/default
sudo mv ./default /etc/nginx/sites-enabled/
sudo systemctl restart nginx
