# About
Latest version of my CV, typesetted in Helvetica and using colors inspired by Monokai (there is an `print` option which renders in black and white, and reverts the header to dark on light, if printing on paper is needed).

Uses TikZ for the header, XeTeX and fontspec to use Helvetica Neue, biblatex to print my publications and textpos for the aside.

# Usage for Cover Letter

To protect the data who will receive the Cover Letter you can use `crypt.sh` to encrypt/decrypt the data.

The following command will create all necessay .tex files that will be used by the cover letter main file.

```
./crypt.sh unpack sample
```

sample.txt can be any name but needs to end in .txt
```
COMPANYADDRESS:ACME Inc.\\123, Foo Street\\L-4200 Luxembourg, Luxembourg
JOBAPPLICATION:Job Application for cybersecurity cybering \& responding expert
COMPANYNAME:ACME
CORESERVICE:amazing cyber services
```

```
./crypt.sh enc
```
Will encrypt the sensitive files in a GPG Armored file.

The unpack command creates the files: [COMPANYNAME,JOBAPPLICATION,COMPANYNAME,CORESERVICE].tex that will be ingested with \input{FILE} in the main TeX document.

# License

Copyright (C) 2012, Adrien Friggeri

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
