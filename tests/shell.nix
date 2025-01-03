{ pkgs ? import ../default.nix {} }:

with pkgs;

mkShell {
  buildInputs = [
    #
    # Holochain
    #
    holochain
    holochain_0
    holochain_0-1
    holochain_0-2
    holochain_0-3
    holochain_0-4

    holochain_0-1-8

    holochain_0-2-5
    holochain_0-2-6-rc-0
    holochain_0-2-6
    holochain_0-2-7-rc-0
    holochain_0-2-7-rc-1
    holochain_0-2-7
    holochain_0-2-8-rc-0
    holochain_0-2-8-rc-1
    holochain_0-2-8

    holochain_0-3-0-beta-dev-35
    holochain_0-3-0-beta-dev-36
    holochain_0-3-0-beta-dev-37
    holochain_0-3-0-beta-dev-38
    holochain_0-3-0-beta-dev-39
    holochain_0-3-0-beta-dev-43
    holochain_0-3-0-beta-dev-44
    holochain_0-3-0-beta-dev-45
    holochain_0-3-0-beta-dev-46
    holochain_0-3-0-beta-dev-48
    holochain_0-3-0
    holochain_0-3-1-rc-1
    holochain_0-3-1-rc-2
    holochain_0-3-1
    holochain_0-3-2

    holochain_0-4-0-dev-1
    holochain_0-4-0-dev-2
    holochain_0-4-0-dev-3
    holochain_0-4-0-dev-4
    holochain_0-4-0-dev-5
    holochain_0-4-0-dev-6
    holochain_0-4-0-dev-7
    holochain_0-4-0-dev-8
    holochain_0-4-0-dev-9
    holochain_0-4-0-dev-10
    holochain_0-4-0-dev-11
    holochain_0-4-0-dev-12
    holochain_0-4-0-dev-13
    holochain_0-4-0-dev-14
    holochain_0-4-0-dev-15
    holochain_0-4-0-dev-16
    holochain_0-4-0-dev-17
    holochain_0-4-0-dev-18
    # holochain_0-4-0-dev-19 does not exist
    holochain_0-4-0-dev-20
    # holochain_0-4-0-dev-21 missing linux binary
    holochain_0-4-0-dev-22
    holochain_0-4-0-dev-23
    holochain_0-4-0-dev-24
    holochain_0-4-0-dev-25
    holochain_0-4-0-dev-26
    holochain_0-4-0-dev-27

    # From "holochain"
    holochain_0-4-0


    #
    # Lair Keystore
    #
    lair-keystore
    lair-keystore_0
    lair-keystore_0-4
    lair-keystore_0-5

    lair-keystore_0-4-2
    lair-keystore_0-4-3
    lair-keystore_0-4-4
    lair-keystore_0-4-5

    lair-keystore_0-5-0
    lair-keystore_0-5-1
    lair-keystore_0-5-2

    # From "holochain"
    lair-keystore_0-5-3


    #
    # Holochain CLI
    #
    hc
    hc_0
    hc_0-2
    hc_0-3
    hc_0-4

    hc_0-2-8

    hc_0-3-0-beta-dev-47
    hc_0-3-1
    hc_0-3-2

    hc_0-4-0-dev-0
    hc_0-4-0-dev-1
    hc_0-4-0-dev-2
    hc_0-4-0-dev-3
    hc_0-4-0-dev-4
    hc_0-4-0-dev-5
    hc_0-4-0-dev-6
    hc_0-4-0-dev-7
    hc_0-4-0-dev-8
    hc_0-4-0-dev-9
    hc_0-4-0-dev-10
    hc_0-4-0-dev-11
    hc_0-4-0-dev-12
    hc_0-4-0-dev-13
    hc_0-4-0-dev-14
    hc_0-4-0-dev-15
    hc_0-4-0-dev-16
    hc_0-4-0-dev-17
    hc_0-4-0-dev-18
    hc_0-4-0-dev-19
    hc_0-4-0-dev-20
    hc_0-4-0-dev-21
    hc_0-4-0-dev-22
    hc_0-4-0-dev-23
    hc_0-4-0-dev-24
    hc_0-4-0-dev-25
    hc_0-4-0-dev-26
    hc_0-4-0-dev-27

    # From "holochain"
    hc_0-4-0
  ];
}
