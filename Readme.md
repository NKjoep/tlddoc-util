#tlddoc-util

The tag library documentation usually is ugly and difficult to generate.


I used to work with java-jar-maven-j2EE on daily base and I wanted to have a better tool than the old [TLDDoc](http://search.maven.org/#artifactdetails%7Ctaglibrarydoc%7Ctlddoc%7C1.3%7Cjar) utility.

So I've started writing my own generator.

##usage
```bash
npm install #only the first time
node tlddoc-util.js -h
```

##sample

```bash
node tlddoc-util.js /myfolder/myfile.tld
```

##license
tlddoc-util is released under the MIT license.
