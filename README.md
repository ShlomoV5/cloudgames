# repo1
some tools that were written upon request
## Tool 1
### Extraction
a tool that gets a list of files and or directories and uncompresses the files according to the deciphering of the 'file' command on them 
###### Written in bash
### Command name is **extract**
## File structure includes
###### include - holding general bash files for reuse
###### scripts - different shell scripts that pertain to the compression command in use
###### datafiles - files that contain data such as the mapping file compressionInfo
### Supported formats for extract
#### bunzip2
#### compress
#### gunzip
#### unzip
###### Note in this version a compressed file will always contain a single compressed file and the decompression is only one level deep  i.e. if the compressed file is a tar archive the archive will not be opened

