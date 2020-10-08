FROM python:buster

WORKDIR /usr/src/app
COPY . .
RUN curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
RUN pip install -r requirements.txt
RUN yes | python manage.py collectstatic

EXPOSE 5000

CMD ["heroku", "local", "web"]
