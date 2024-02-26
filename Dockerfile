FROM python:3.8.17

RUN pip3 install --upgrade pip==23.2.1

# RUN useradd -ms /bin/bash worker
# USER worker
WORKDIR /usr/src/app

#ENV PATH="/home/worker/.local/bin:${PATH}"

COPY . ./
RUN pip3 install --no-cache-dir -r requirements.txt
RUN chown -R 1001:0 /usr/src/app
# Adjust permissions on workdir so writable by group root.
RUN chmod -R g+w /usr/src/app

USER 1001

EXPOSE 8088

CMD [ "gunicorn" , "--bind" , "0.0.0.0:8088" , "wsgi:app" ] 
