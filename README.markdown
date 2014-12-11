# Toys.com

This is a client to be used to consume the shipping API.

Getting Started
---------------

1. Fork and clone this repo
1. Sign up for AWS
    - Go to the IAM section to obtain API keys
    - Go the S3 section, create a bucket named whatever you want
1. Create a `.env` in the root of the app and add the needed information from AWS (example `.env` [here](https://gist.github.com/6d859d51dddc4b3cfa57))
1. Setup your DB (db:create db:migrate db:seed)

Test
------
Run the tests

```bash
rspec
```
