# unpack_macbinary

This tool provides a helper to convert files from MacBinary format into native Mac HFS+ files.

Mac OS's HFS and HFS+ filesystems has a concept of file "forks"; each file has both a *data fork*, which contains arbitrary binary data like on other filesystems, and a *resource fork*, which contains structured data in a Mac OS-specific format.
The [MacBinary format](https://en.wikipedia.org/wiki/MacBinary) is a format designed to bundle files with both data and resource forks in a format which can be losslessly transferred to other filesystems; it was most widely used in the 1990s.

However, if a Mac user should *receive* a MacBinary file, it's not straightforward to convert that file back into a native Mac OS file.
This tool simplifie the process of turning a MacBinary file into a native Mac file by wrapping a tool from the [macutils](http://ibiblio.org/pub/linux/utils/compress/macutils.tar.gz) package.

## Installation

To run this, you'll need macutils to be installed.
If you use Homebrew, you can:

    $ brew install mistydemeo/formulae/macutils

Then install the gem using:

    $ gem install unpack_macbinary

## Usage

Just provide this tool the names of the files to unpack:

    $ unpack_macbinary first.bin second.bin third.bin

The MacBinary files should all have filenames ending in ".bin".
The processed output file will be named the same as the input file, except without the file extension.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/unpack_macbinary. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

unpack_macbinary is licensed using the Kindest Public License.
See LICENSE for usage details.
