setup:
	bundle install && pod install --repo-update

setup_scmake:
	go mod init scmake
	go mod tidy
	go build scmake

	rm go.mod
	rm go.sum

mock:
	mockolo -s ./BookStoreTexture/Sources -d ./BookStoreTextureTests/OutputMocks.swift -i BookStoreTexture --use-mock-observable

test:
	bundle exec fastlane ios ci_test