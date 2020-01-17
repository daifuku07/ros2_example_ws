FROM ros:dashing
COPY src /workspace/src
SHELL ["/bin/bash", "-c"]
WORKDIR /workspace
RUN echo "now building..."
RUN . /opt/ros/dashing/setup.bash
ENV AMENT_PREFIX_PATH /opt/ros/dashing
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/opt/ros/dashing/opt/yaml_cpp_vendor/lib:/opt/ros/dashing/opt/rviz_ogre_vendor/lib:/opt/ros/dashing/lib:/usr/local/lib
ENV PYTHONPATH /opt/ros/dashing/lib/python3.6/site-packages
ENV PATH $PATH:/opt/ros/dashing/bin
RUN rosdep install --ignore-src --from-paths src -y
RUN colcon build
