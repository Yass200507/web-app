FROM python:3.12-slim
EXPOSE 5000
COPY . /usr/web/
WORKDIR /usr/web
RUN pip install -r requirements.txt
CMD [ "python","app.py" ]