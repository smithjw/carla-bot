# AWS Login
CMD aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
CMD aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
CMD aws configure set default.region ap-southeast-2

# Build image
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
docker build -t smithjw/carla-bot:$BUILDKITE_COMMIT .

# Run container with specs
docker run -e HUBOT_SLACK_TOKEN=xoxb-8344396325-jzoL2q7q12Bp0fEWE55iDNaE -d smithjw/carla-bot:$BUILDKITE_COMMIT

# Tag image with current branch name and push when specs are green
docker tag -f smithjw/carla-bot:$BUILDKITE_COMMIT smithjw/carla-bot:$BUILDKITE_BRANCH
docker push smithjw/carla-bot:$BUILDKITE_BRANCH

# Testing
