FROM ubuntu:20.04

# Installing dependencies:
# ----------------------------
RUN apt-get update\
	&& apt-get install -y apt-utils\
	&& apt-get install -y git\
	&& apt-get install -y curl\
	&& apt-get install -y unzip\
	&& DEBIAN_FRONTEND="noninteractive" apt-get install -y tzdata\
	&& apt-get install -y openjdk-8-jdk

# Installing flutter: 
# ----------------------------
RUN apt-get update
RUN git clone https://github.com/flutter/flutter.git --progress --verbose
ENV PATH="$PATH:/flutter/bin"

# Installing android SDK:
# ----------------------------
ENV ANDROID_HOME="/android-sdk"
ENV PATH="PATH=${PATH}:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/build-tools/"
ENV ANDROID_SDK_ROOT="/android-sdk"
ENV ANDROID_AVD_HOME="/avd"

RUN mkdir android-sdk
RUN mkdir avd
ENV ANDROID_HOME=/android-sdk
RUN curl https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip --output android-sdk.zip
RUN unzip -qq android-sdk.zip -d android-sdk
# Only once - after installing build-tools sdkmanager will be accessable 
# under /android-sdk/tools/bin
RUN yes| /android-sdk/cmdline-tools/bin/sdkmanager --sdk_root=/android-sdk --install "build-tools;29.0.3"
RUN yes| sdkmanager --install "system-images;android-29;default;x86_64"
RUN yes| sdkmanager --install "platforms;android-29"
RUN yes| sdkmanager --licenses

# Setting Flutter:
# ----------------------------
RUN flutter channel beta 
RUN flutter upgrade
RUN flutter config --enable-web
RUN flutter doctor

# Creating workspace:
# ----------------------------
RUN mkdir workspace
