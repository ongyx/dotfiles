# helix

This Helix config requires the [plugin fork] to work. To clone it, run:

```sh
git clone git@github.com:helix-editor/helix.git
cd helix
git remote add mattwparas git@github.com:mattwparas/helix.git
git fetch mattwparas steel-event-system
git switch steel-event-system
```

Make sure to add `~/.cargo/bin` and `~/.steel/bin` to `$PATH`, then install it along with the plugins by running:

```
cargo xtask steel
cd plugins && forge install .
```

[Steel plugin fork]: https://github.com/mattwparas/helix/tree/steel-event-system
