# Build Stage
FROM golang:1.24.4-alpine AS builder


WORKDIR /app

# Install git (for go get), upgrade packages
RUN apk add --no-cache git

# Copy go.mod dan download dependencies
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# Copy seluruh project
COPY . .

# Build binary
RUN go build -o main .

# Run Stage (clean, final image)
FROM alpine:latest

WORKDIR /app

# Copy binary dari builder stage
COPY --from=builder /app/main .

# Expose port (sesuai di main.go)
EXPOSE 3000

# Jalankan app
CMD ["./main"]
