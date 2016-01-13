# Bloom filter

A simple [Bloom filter](https://en.wikipedia.org/wiki/Bloom_filter) implementation in swift.

## Usage

	// Setup a instance of the filter
	let filter = BloomFilter<String>()
	
	// Add an element to the filter
	filter.addElement("foo")

	// Test if an element is present in the filter
	subject.contains("bar")

## Contact
[Jonathan](mailto:jonathan@float-right.co.uk)

