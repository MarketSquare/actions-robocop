FROM python:3.9-alpine

COPY LICENSE \
        README.md \
        entrypoint.sh \
        requirements.txt \
        /code/

RUN pip install -r /code/requirements.txt

ENTRYPOINT ["/code/entrypoint.sh"]
CMD []