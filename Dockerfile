FROM rustlang/rust:nightly-slim as build
WORKDIR /app
RUN mkdir -p $HOME/.cargo
COPY diesel_demo/ /app
COPY diesel_demo/config $HOME/.cargo/
RUN apt-get update && apt-get install -y libpq-dev
RUN rustup --version
RUN rustc --version && \
    rustup --version && \
    cargo --version
RUN cargo build --bin show_posts --release

FROM debian:stretch-slim
WORKDIR /app
RUN apt-get update && apt-get install -y libpq5
COPY  diesel_demo/.env-prod /app/.env
COPY --from=build /app/target/release/show_posts /usr/local/bin/show_posts
CMD [ "show_posts" ]


