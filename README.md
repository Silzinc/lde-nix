This is a flake for **installing** [`lpm`](https://github.com/codebycruz/lpm) from its Github releases, not for building it. It can be consumed in your flake as follows:
```nix
{
  # Pinned version, here for instance v0.7.2
  inputs.lpm.url = "github:Silzinc/lpm-nix?ref=refs/tags/v0.7.2";
  # Nightly build, may not work depending on the maintainer's reactivity
  inputs.lpm.url = "github:Silzinc/lpm-nix/nightly";
}
```
Then, add `lpm.packages.${builtins.currentSystem}.default` wherever you install packages (assuming you added `lpm` as an argument to your flake output).
