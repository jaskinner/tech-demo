FROM crystallang/crystal:latest

RUN apt-get update && apt-get install -y libsqlite3-dev cron

ADD scraper-cron /etc/cronjob
RUN crontab /etc/cronjob

WORKDIR /app

COPY . .

RUN shards install

CMD ["crystal", "run", "src/tech-demo.cr"]
