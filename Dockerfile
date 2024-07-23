FROM ubuntu:latest
LABEL authors="Kelvin"

ENTRYPOINT ["top", "-b"]