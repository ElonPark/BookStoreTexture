package main

import (
	scaffold "github.com/Geektree0101/clean-swift-scaffold"
	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:   "scmake",
		Short: "book store scaffold tool",
	}
)

func main() {
	rootCmd.AddCommand(scaffold.NewRunnerCommand("scaffold"))
	rootCmd.Execute()
}
