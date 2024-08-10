package tree_sitter_jsonnet_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/tree-sitter/tree-sitter-jsonnet"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_jsonnet.Language())
	if language == nil {
		t.Errorf("Error loading Jsonnet grammar")
	}
}
