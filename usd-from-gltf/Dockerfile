# Since USD takes so long to build, we separate it into it's own container
FROM timknip/usd:latest

WORKDIR /usr/src/ufg

# Add NASM
RUN apt-get install nasm

# Add PIL
RUN pip install Pillow

# Configuration
ARG UFG_RELEASE="dce1ca4b6dd1c74545a645e0ba65118b0626dfa5"
ARG UFG_SRC="/usr/src/ufg"
ARG UFG_INSTALL="/usr/local/ufg"
ENV USD_DIR="/usr/local/usd"
ENV LD_LIBRARY_PATH="${USD_DIR}/lib:${UFG_SRC}/lib"
ENV PATH="${PATH}:${UFG_INSTALL}/bin"
ENV PYTHONPATH="${PYTHONPATH}:${UFG_INSTALL}/python"

# Build + install usd_from_gltf
RUN git init && \
    git remote add origin https://github.com/timknip/usd_from_gltf.git && \
    git fetch --depth 1 origin "${UFG_RELEASE}" && \
    git checkout FETCH_HEAD && \
    python "${UFG_SRC}/tools/ufginstall/ufginstall.py" -v "${UFG_INSTALL}" "${USD_DIR}" && \
    cp -r "${UFG_SRC}/tools/ufgbatch" "${UFG_INSTALL}/python" && \
    rm -rf "${UFG_SRC}" "${UFG_INSTALL}/build" "${UFG_INSTALL}/src"

RUN mkdir /usr/app
WORKDIR /usr/app

# Start the service
ENTRYPOINT ["usd_from_gltf"]
CMD ["usd_from_gltf"]
