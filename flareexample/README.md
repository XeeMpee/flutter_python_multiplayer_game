# flareexample

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Using docker:

### Buiild image:
```
docker build -t fluttergame . 
```


### Building flutter apps:

Building web app:
```
docker run -v $PWD/flareexample:/workspace/flutterapp -v $PWD/common:/workspace/common -w /workspace/flutterapp -t fluttergame bash build.sh --build=web --uid=$UID --gid=$GID
```

Builing android app:
```
docker run -v $PWD/flareexample:/workspace/flutterapp -v $PWD/common:/workspace/common -w /workspace/flutterapp -t fluttergame bash build.sh --build=apk --uid=$UID --gid=$GID
```

### Warning  
Soemtimes after using docker for builds there is necessery to run `flutter clean` before local build.


