# Build image
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker build -t smithjw/carla-bot:$BUILDKITE_COMMIT .

# Run container with specs
# docker run -e HUBOT_SLACK_TOKEN=xoxb-7834657472-32TecFyNwzjI9UcsMgoTrz3I -d smithjw/frank-bot:$BUILDKITE_COMMIT

# Tag image with current branch name and push when specs are green
# docker tag -f smithjw/frank-bot:$BUILDKITE_COMMIT smithjw/frank-bot:$BUILDKITE_BRANCH
# docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
# docker push smithjw/frank-bot:$BUILDKITE_BRANCH
