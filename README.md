# tech-demo

In this demo, I'm using Crystal language in a dockerized environment. Using shards myhtml to parse the html upon scraping and a sqlite connector, this application fetches price data for a specific model on the product page and commits it to the sqlite database with a unix timestamp and date.

The docker container is built using docker compose to create a crystal language environment on a linux image. Necessary dependencies are pulled and the cron flow is established by pulling in a configurable file called scraper-cron. Cron must be run explicitly to begin the cron process.

## Installation

`docker compose up`

## Usage

If collecting data, run `cron` inside the docker command line to start collecting every 60 seconds.

visit 0.0.0.0:8080 in a browser.
