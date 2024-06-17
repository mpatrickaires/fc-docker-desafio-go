FROM golang:1.22.4 AS builder

WORKDIR /usr/src/app

COPY full-cycle-rocks.go .

RUN go build full-cycle-rocks.go


FROM scratch AS final

COPY --from=builder /usr/src/app/full-cycle-rocks .

ENTRYPOINT ["./full-cycle-rocks"]
