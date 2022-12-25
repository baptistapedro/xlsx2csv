FROM golang:1.19.1-buster as go-target
ADD . /xlsx2csv
WORKDIR /xlsx2csv
RUN go build

FROM golang:1.19.1-buster
COPY --from=go-target /xlsx2csv/xlsx2csv /
COPY --from=go-target /xlsx2csv/testdata/*.xlsx /testsuite/

ENTRYPOINT []
CMD ["/xlsx2csv", "@@"]
