# Dockerfile Playwright on RP4

Forked from original to keep it updated. 

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
