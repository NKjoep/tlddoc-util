#tlddoc-util

The tag library documentation usually is ugly and difficult to generate.

I work with java-jar-maven-j2EE on daily basis and I wanted to have a better tool than the old [TLDDoc](http://search.maven.org/#artifactdetails%7Ctaglibrarydoc%7Ctlddoc%7C1.3%7Cjar) utility.

So I've started writing my own generator compatible with the [tag library 2.0](http://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd)

##usage
```bash
npm install #only the first time
node tlddoc-util.js -h
```

##sample

```bash
node tlddoc-util.js --output=folder_output /archived/file.tld
```

##license
tlddoc-util is released under the MIT license.
