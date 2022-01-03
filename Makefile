setup:
	bundle install && pod install --repo-update

test:
	bundle exec fastlane ios ci_test