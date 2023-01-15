# Dockerfile for playwright-python on raspberry pi 4

This dockerfile demonstrate how to install playwright-python on raspberry pi 4. 


## Run it

```bash
# Build the image
docker build --pull --rm -t playwrightrpi4:latest "."

# Run it
docker run --rm -it  playwrightrpi4:latest
# it should show playwright webpage title:
# Fast and reliable end-to-end testing for modern web apps | Playwright
```
