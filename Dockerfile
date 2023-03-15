# Create build stage based on buster image
FROM golang:1.18-buster AS builder
# Create working directory under /app
WORKDIR /app
# Copy over all go config (go.mod, go.sum etc.)
COPY go.* ./
# Install any required modules
RUN go mod download
# Copy over Go source code
COPY *.go ./
# Run the Go build and output binary under folder
RUN go build -o ./
# Make sure to expose the port the HTTP server is using
EXPOSE 8080
# Run the app binary when we run the container
ENTRYPOINT ["./"]