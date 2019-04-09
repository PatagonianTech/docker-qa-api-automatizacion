# Docker QA API Automation

## Requeriments

- **GIT**
- Latest [**Docker CE**](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Setup

Run next:

```bash
./build.sh
```

## Define ENV variables for report customise

```bash
EXPORT REPNAME='report-file-name'
EXPORT REPTITLE='report-tile'
```

## Run

```bash
cd your/test/script/app

run-test-api script-name.js
```

## Report

Under `your/test/script/app/report` you'll find an HTML with report name define in _ENV REPNAME_

The service doesn't overwrite older reports.
