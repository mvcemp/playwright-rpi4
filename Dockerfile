FROM python:3.10.9-buster

# Install Chromium and node.js for arm
RUN apt-get update && \
    apt-get install -y \
    chromium \
    curl \
    sudo


RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app

# Download playwright for linux x86_64
RUN wget https://files.pythonhosted.org/packages/f5/5a/62691da54ac1e34f71af413007deb399183e3b0ec45690d58c82f942ccb7/playwright-1.29.1-py3-none-manylinux1_x86_64.whl

# Rename it so that it can be installed on arm
RUN mv playwright-1.29.1-py3-none-manylinux1_x86_64.whl playwright-1.29.1-py3-none-any.whl

RUN pip install playwright-1.29.1-py3-none-any.whl

# replace the node binary provided by playwright with a symlink to the version we just installed.
RUN rm /usr/local/lib/python3.10/site-packages/playwright/driver/node && \
    ln -s /usr/bin/node /usr/local/lib/python3.10/site-packages/playwright/driver/node

# create the hierarchy expected by playwright to find chrome
RUN mkdir -p /app/pw-browser/chromium-1041/chrome-linux
# Add a symlink to the chromium binary we just installed.
RUN ln -s /usr/bin/chromium /app/pw-browser/chromium-1041/chrome-linux/chrome
# ask playwright to search chrome in this folder
ENV PLAYWRIGHT_BROWSERS_PATH=/app/pw-browser

# Copy the test file
COPY main.py /app/main.py

CMD [ "python3.10", "main.py" ]
