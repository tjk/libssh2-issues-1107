FROM ruby:2.7.7

RUN apt-get update && apt-get install -y cmake pkg-config

RUN wget -c https://github.com/libssh2/libssh2/releases/download/libssh2-1.10.0/libssh2-1.10.0.tar.gz -O - \
    | tar -xz \
    && cd libssh2-1.10.0 \
    && mkdir bin && cd bin \
    && cmake -DBUILD_STATIC_LIBS=OFF -DBUILD_SHARED_LIBS=ON .. \
    && cmake --build . \
    && make install

COPY . .

RUN CMAKE_FLAGS='-DUSE_SSH=ON' bundle install

CMD ["bundle", "exec", "ruby", "test.rb"]