# Ubuntu images with jdk18 ready to work

With this image you can run your JAVA applications using jdk18 and OpenCV 4.5.1. It is built used tag version of Ubuntu and OpenCV.

## Quick reference

With thiw image, you can use commands like this:

```Docker
FROM diegolaucsen/ubuntu-jdk18-opencv:20.04-opencv-4.5.1

COPY target/*.war /app.war

ENTRYPOINT ["java","-jar","/app.war"]
```

If your application depend from OpenCV library, it will link to this tools with following commands (Example with Java + Spring):

### On your project startup (main function)

This command will link your project to OpenCV library.

```Java
System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
```

### Befor use any OpenVC operations, do this

```Java
OpenCV.loadLocally();
```

## Available Tags

* [20.04-opencv-4.5.1](https://github.com/Laucsen/ubuntu-jdk18-opencv)

## Read more

* [Ubuntu](https://hub.docker.com/_/ubuntu)
* [OpenCV](https://opencv.org/)
