package pkg

import "testing"

func TestWorkspaceBootstrapped(t *testing.T) {
	t.Parallel()

	const expectedPackageName = "pkg"
	if expectedPackageName != "pkg" {
		t.Fatalf("unexpected package name: %s", expectedPackageName)
	}
}
