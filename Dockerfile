FROM python:latest

#COPY ./dist/         \
#  /tmp/dist/
#
#RUN pip install      \
#  /tmp/dist/*.whl    \
#&& rm -frv           \
#  /tmp/dist/
RUN pip install teamhack_dns \
&&  test -x /usr/bin/env     \
&&  command -v python        \
&&  command -v nslookup

WORKDIR  /var/teamhack
VOLUME ["/var/teamhack/etc"]

ENTRYPOINT [         \
  "/usr/bin/env",    \
  "python",          \
  "-m",              \
  "teamhack_dns"     \
]

EXPOSE 53/udp

