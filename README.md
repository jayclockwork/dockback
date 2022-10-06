# What's This?

This directory contains files needed to run BackstopJS for automated visual differences of a website. These instructions show how to run BackstopJS from within a Docker container.

## Dependencies

- Docker installed and running

## Configuring the tests

Edit the file `./test/backstop.json`. The two areas most often edited are:

- viewports - control the different screen sizes to use during the tests.
- scenarios - defines the webpages to visit for the tests.

### Defining Scenarios

Specifing the webpages to compare is done by creating scenarios in the file `./test/backstop.json`.

An example scenario is shown below:

```yaml
{
    "label": "Home",
    "url": "https://dev.site/",
    "referenceUrl": "https://production.site/",
    "misMatchThreshold": 0,
    "delay": 10000
},
```

## Running Tests with a Script

These tests can be run with the `visual_diff.sh` script in the bin directory.

1. Make sure docker is running.
2. Run the test script. By default, this script will use the test configuration described by backstop.json.

```bash
./bin/visual_diff.sh
```

3. The test results will open in a browser tab when finished.

## Bugs

- Sometimes the script will not finish if there are too many pages to compare, or too many viewports defined
