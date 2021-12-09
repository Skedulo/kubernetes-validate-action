# kubernetes-validate github action

This action runs kubernetes-validate against a directory

## Inputs

### `directory`

**Required** The directory containing manifest files to validate

### `version`

Version of kubernetes to validate against. Defaults to the latest
for the version of this action.

### `strict`

Whether to enforce unexpected additional properties (this is useful
to detect mis-named/mis-typed properties)

## Outputs

## `output`

The output of running kubernetes-validate

## Example usage

```
uses: Skedulo/kubernetes-validate@v1.22.0
with:
  directory: output
  strict: true
  version: 1.21.0
```
