# ROS Melodic with custom environment
FROM ros:melodic
MAINTAINER Markov Alex <markovalex95@gmail.com>

# Install environment
RUN apt update
RUN apt install -y curl
RUN curl -sL https://raw.githubusercontent.com/Garrus007/dotfiles/master/dotfiles/setup.sh | bash
RUN echo "cd /root/" >> "/root/.zshrc"

# Configure ROS
RUN rm /ros_entrypoint.sh
RUN curl <> -o ros_entrypoint.zsh
ENTRYPOINT ["/ros_entrypoint.zsh"]
CMD ["zsh"]

