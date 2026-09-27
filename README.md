<!--
	SPDX-FileCopyrightText: Cynthia Rey <cynthia@cynthia.dev>
	SPDX-License-Identifier: 0BSD
-->

# Żmij - ECMA edition
Patched version of https://github.com/dtolnay/zmij which conforms to [ECMA-262]'s [`Number::toString`] algorithm.

Inspired by the existence of Boa's [ryu-js], written as a patch series via [quilt(1)] rather than a soft fork.

## Building
Run `just make-crate` to generate the patched `zmij-js` crate. Inside the patched crate, tests and benchmarks are
updated to check against `ryu-js`.

## License
The original Żmij by Victor Zverovich and the Rust port by David Tolnay are licensed under the MIT license, which
applies to this downstream build.

The patches are licensed under the Zero-Clause BSD license. I don't think they are substantial enough on their own to
deserve being qualified as "copyrightable work"; but for the sake of consistency and legal clarity across all
jurisdictions, a public-domain-equivalent license seems the most appropriate and fair.

[ECMA-262]: https://tc39.es/ecma262
[`Number::toString`]: https://tc39.es/ecma262/#sec-numeric-types-number-tostring
[ryu-js]: https://github.com/boa-dev/ryu-js

[quilt(1)]: https://man.archlinux.org/man/quilt.1
