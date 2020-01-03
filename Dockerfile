FROM archlinux
RUN pacman -Sy --noconfirm
RUN pacman -S --noconfirm archlinux-keyring 
RUN pacman -S --noconfirm devtools binutils fakeroot
RUN useradd -m -g wheel builder

USER builder
#COPY --chown=builder:wheel . /arch-pkgs
#RUN mkdir /arch-pkgs/output; chown -R builder:wheel /arch-pkgs/output

WORKDIR /arch-pkgs
CMD ["./build.sh"]
