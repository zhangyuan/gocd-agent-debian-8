FROM gocd/gocd-agent-debian-8:v17.12.0

RUN apt-get update && apt-get install -y libltdl7 && rm -rf /var/lib/apt/lists/*