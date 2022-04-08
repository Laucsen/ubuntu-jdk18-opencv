FROM diegolaucsen/ubuntu-jdk18:20.04

# 1. Build OpenCV
#ARG DEBIAN_FRONTEND=noninteractive
COPY scripts/install_opencv.sh install_opencv.sh
RUN chmod +x install_opencv.sh && sync && ./install_opencv.sh && rm install_opencv.sh

# 2. Instal OpenCV running time tools
COPY scripts/install_execution_tools.sh install_execution_tools.sh
RUN chmod +x install_execution_tools.sh && sync && ./install_execution_tools.sh && rm install_execution_tools.sh

# 3. Install opencv on lib folder
RUN cp /opencv-java-bin/libopencv_java451.so ./lib
RUN cp /opencv-java-bin/opencv-451.jar ./lib
RUN rm -r /opencv-java-bin

CMD ["bash"]
