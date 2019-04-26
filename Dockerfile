FROM dgellow/idris:latest
ARG username
ARG uid
ARG gid

RUN groupadd -f -g ${gid} drago \
 && useradd -u ${uid} -m ${username} \
 && usermod -aG drago ${username} \
 && chown -R ${username}:drago /root/.cabal \
 && chgrp drago /root \
 && chmod g+rx /root

USER ${username}
ENV PATH=/root/.cabal/bin:$PATH
WORKDIR /home/${username}
ENTRYPOINT ["idris"]
CMD []
