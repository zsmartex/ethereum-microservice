// Copyright 2017 The go-zsmart Authors
// This file is part of the go-zsmart library.
//
// The go-zsmart library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-zsmart library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-zsmart library. If not, see <http://www.gnu.org/licenses/>.

package core

// Constants containing the genesis allocation of built-in genesis blocks.
// Their content is an RLP-encoded list of (address, balance) tuples.
// Use mkalloc.go to create/update them.

// nolint: misspell
const mainnetAllocData = "\xf8F\xe2\x94Ii\xccr\xf54\x03\xbc\xbc6&\xd4}X\xb3\x80aF6\x13\x8c\x02't(aJ\x86[\x80h\x00\x00\xe2\x94x\xd6\xf7\xc6\x1a\xc1\xac5\xbf$F\x15\x17)Bffffo\x8c\x02't(aJ\x86[\x80h\x00\x00"
const ropstenAllocData = "\xc0"
const rinkebyAllocData = "\xc0"
const goerliAllocData = "\xc0"
const yoloV1AllocData = "\xc0"
